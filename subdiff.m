## -*- texinfo -*-
## @documentencoding UTF-8
## @defunx subdiff (@var{A}, @var{b})
## @defunx subdiff (@var{A}, @var{b}, @var{options})
##
## Returns formal solution of the interval linear system A &middot; x = b.
## in Kaucher complete interval arithmetic by subdifferential Newton method 
## proposed in:
##   Shary, S.P. (1996). Algebraic approach to the interval linear static 
##   identification, tolerance and control problems, or one more application 
##   of Kaucher arithmetic // Reliable Computing 2(1), 1996, pp 3–33.
##
## @param @var{A} the interval matrix A of the system
## @param @var{b} the right-hand side interval vector
## @param @var{options} parameters of subdifferential Newton's method 
## Default options:
##   options.max_iterations_num = 50
##   options.eps = 1e-6
##   options.tau = 1
##   options.norm_min_val = 1e-6
##
## @example
## @group
## Ainf = [ kinterval( 2,4) kinterval(-2,1);
##          kinterval(-1,2) kinterval( 2,4)];
## binf = [ kinterval(-2,2) kinterval(-2,2)];
## x = subdiff(A, b)
## @result{} x =
##  [-0.333333,0.333333]
##  [-0.333333,0.333333]
## Ax = A * x
## @result{} Ax =
##  [-2,2]
##  [-2,2]
## 
## opts.stepwise = 1; # solve the same ILS step by step
## [x, opts] = subdiff(A, b, opts);  # First iteration
## fprintf("=============\niteration: %d\n", opts.status.iteration);
## x 
##
## while ~opts.finish # Second and all the rest iterations
##    [x, opts] = subdiff(opts);
##    fprintf("=============\niteration: %d\n", opts.status.iteration);
##    x 
## endwhile
## @end group
## @end example
## @seealso{@@kinterval/resize, @@kinterval/cat, @@kinterval/postpad, @@kinterval/prepad}
## @end defunx

function [result, opt] = subdiff(varargin)
global A b iteration n q r xx

    if nargin > 1 
        A = varargin{1};
        b = varargin{2}; 

        result = [];
        if ~checkDimensions(A,b)
           return;
        endif

        opt = setOptions(varargin);

        n = rows(A);

        F = superMatrix(A);
        xx = [inf(b); sup(b)];

        xx = F \ xx;

        r = realmax;
        q = 1;

        iteration = 0;
    else
        opt = varargin{1};
        if (~isfield(opt,'stepwise') || ~isfield(opt,'finish') || ~isfield(opt,'finish'))
            error("Wrong usage (single argument is allowed in stepwise mode only)");
            print_usage();
            return;
        endif
        if opt.finish
            return;
        endif
        restoreStatus(opt.status);
    endif

    while iteration < opt.max_iterations_num && r / q > opt.eps
        iteration = iteration + 1;

        r = 0;
        x = xx;
        F = zeros(2*n,2*n);

        for i = 1:n
            s = kinterval(0);
            for j = 1:n
                g = A(i, j); 
                h = kinterval(x(j), x(j + n));
                t = g * h; 
                s = s + t;
                F = calcSubgrad(F, i, j, g, h);
            endfor

            t = innerminus(s, b(i));

            xx(i) = inf(t);
            xx(i + n) = sup(t);

            r = r + mag(t);
        endfor
        xx =  F \ xx;
        xx = x -  xx .* opt.tau;
        q = norm(xx,1); # L1 norm
        if q <= opt.norm_min_val
            q = 1;
        endif

        if (isfield(opt,'stepwise') && opt.stepwise)
            opt.finish = ~(iteration < opt.max_iterations_num && r / q > opt.eps);
            opt.status = storeStatus();
            result = kinterval( xx(1:n), xx(n+1:end) );
            return;
        endif

    endwhile

    result = kinterval( xx(1:n), xx(n+1:end) );
endfunction

function result = checkDimensions(A,b)
  if ~issquare(A)
      error ("matrix is not square");
      result = false;
  endif
  if columns(A) ~= rows(b)
      error ("mismatch of matrix and vector dimensions");
      result = false;
  endif
  result = true;
endfunction

function opt = setOptions(args)
    opt = struct("max_iterations_num",50, "eps",1e-6, "tau",1, "norm_min_val",1e-6, "mode","standard", "stepwise",false);

    if numel(args) > 2
        options = args{3};
        fn = fieldnames(opt);
        for k = 1:numel(fn)
            if isfield(options,fn{k})
                val = getfield(options, fn{k});
                opt = setfield (opt, fn{k}, val);
            endif
        endfor
    endif
endfunction

function result = superMatrix(A)
    midA = mid(A);
    P = (midA >= 0);
    midAp = zeros(size(midA));
    midAm = midAp;
    midAp(P) = midA(P);
    midAm(~P) = midA(~P);
    result = [midAp midAm; midAm midAp];
endfunction

function status = storeStatus()
    vars = who("global");

    eval(["global" sprintf(' %s',vars{:})]);

    vals = cell(size(vars));
    for k = 1:numel(vars)
        vals{k} = eval(vars{k});
    endfor

    status = cell2struct(vals, vars);
endfunction

function restoreStatus(status)
    vars = fieldnames(status);
    vals = struct2cell(status);

    eval(["global" sprintf(' %s',vars{:})]);

    for k = 1:numel(vars)
        assignin ("caller", vars{k}, vals{k}); 
    endfor
endfunction


# Set pair of F elements using A(i,j), [x(j),x(j+n)]
function F = calcSubgrad(F, i, j, a, b)
    n = rows(F) / 2;

    ai = inf(a);
    as = sup(a);
    bi = inf(b);
    bs = sup(b);

    if sign(ai) * sign(as) > 0 
         if sign(ai) > 0,  k = 0; else k = 2; endif
    else
         if ai < as,       k = 1; else k = 3; endif
    endif

    if sign(bi) * sign(bs) > 0
        if sign(bi) > 0,  m = 1; else m = 3; endif 
    else
         if bi <= bs,     m = 2; else m = 4; endif
    endif

    switch (4 * k + m)
        case 1
            F(i,     j)     = ai;
            F(i + n, j + n) = as;
        case 2
            F(i,     j)     = as;
            F(i + n, j + n) = as;
        case 3
            F(i,     j)     = as;
            F(i + n, j + n) = ai;
        case 4
            F(i,     j)     = ai;
            F(i + n, j + n) = ai;
        case 5
            F(i,     j + n) = ai;
            F(i + n, j + n) = as;
        case 6
            if  ai * bs < as * bi
                F(i, j + n) = ai;
            else
                F(i, j)     = as;
            endif
            if ai * bi > as * bs
                F(i + n, j)     = ai;
            else
                F(i + n, j + n) = as;
            endif
        case 7
            F(i,     j) = as;
            F(i + n, j) = ai;
        case 9
            F(i, j + n) = ai;
            F(i + n, j) = as;
        case 10
            F(i, j + n) = ai;
            F(i + n, j) = ai;
        case 11
            F(i, j + n) = as;
            F(i + n, j) = ai;
        case 12
            F(i, j + n) = as;
            F(i + n, j) = as;
        case 13
            F(i,     j) = ai;
            F(i + n, j) = as;
        case 15
            F(i,     j + n) = as;
            F(i + n, j + n) = ai;
        case 16
            if ai * bi  > as * bs
                F(i, j)     = ai;
            else
                F(i, j + n) = -as;
            endif
            if ai * bs < as * bi
                F(i + n, j + n) = ai;
            else
                F(i + n, j)     = as;
            endif
    endswitch

endfunction