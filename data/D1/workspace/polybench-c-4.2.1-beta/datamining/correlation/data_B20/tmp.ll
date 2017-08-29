; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  call void (...) @polybench_timer_start() #3
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, [1200 x double]*) unnamed_addr #0 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %20, %4
  %indvars.iv5 = phi i64 [ 0, %4 ], [ %indvars.iv.next6, %20 ]
  %5 = trunc i64 %indvars.iv5 to i32
  %6 = sitofp i32 %5 to double
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv5
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = fadd double %6, %11
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv
  store double %12, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv5
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.200000e+03
  %18 = fadd double %6, %17
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1400
  br i1 %exitcond, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
  %8 = alloca double, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca double*, align 8
  %12 = alloca double*, align 8
  %13 = alloca double, align 8
  store double %2, double* %8, align 8
  store [1200 x double]* %3, [1200 x double]** %9, align 8
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  store double* %5, double** %11, align 8
  store double* %6, double** %12, align 8
  store double 1.000000e-01, double* %13, align 8
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.lr.ph64, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %7
  br label %._crit_edge9

.lr.ph64:                                         ; preds = %7
  %wide.trip.count134.3 = zext i32 %1 to i64
  %15 = icmp sgt i32 %1, 0
  %16 = sext i32 %0 to i64
  br i1 %15, label %.lr.ph64.split.us.preheader, label %.lr.ph64.split.preheader

.lr.ph64.split.preheader:                         ; preds = %.lr.ph64
  %17 = fdiv double 0.000000e+00, %2
  %18 = icmp sgt i64 %16, 1
  %smax201 = select i1 %18, i64 %16, i64 1
  %min.iters.check = icmp ult i64 %smax201, 4
  br i1 %min.iters.check, label %.lr.ph64.split.preheader209, label %min.iters.checked

.lr.ph64.split.preheader209:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph64.split.preheader
  %indvars.iv144.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph64.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph64.split

min.iters.checked:                                ; preds = %.lr.ph64.split.preheader
  %n.vec = and i64 %smax201, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph64.split.preheader209, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert203 = insertelement <2 x double> undef, double %17, i32 0
  %broadcast.splat204 = shufflevector <2 x double> %broadcast.splatinsert203, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = add nsw i64 %n.vec, -4
  %20 = lshr exact i64 %19, 2
  %21 = add nuw nsw i64 %20, 1
  %xtraiter214 = and i64 %21, 7
  %lcmp.mod215 = icmp eq i64 %xtraiter214, 0
  br i1 %lcmp.mod215, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %prol.iter216 = phi i64 [ %xtraiter214, %vector.body.prol.preheader ], [ %prol.iter216.sub, %vector.body.prol ]
  %22 = getelementptr inbounds double, double* %5, i64 %index.prol
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %23, align 8
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %25, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter216.sub = add i64 %prol.iter216, -1
  %prol.iter216.cmp = icmp eq i64 %prol.iter216.sub, 0
  br i1 %prol.iter216.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.ph, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %26 = icmp ult i64 %19, 28
  br i1 %26, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr, %vector.ph.new ], [ %index.next.7, %vector.body ]
  %27 = getelementptr inbounds double, double* %5, i64 %index
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %28, align 8
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %30, align 8
  %index.next = add i64 %index, 4
  %31 = getelementptr inbounds double, double* %5, i64 %index.next
  %32 = bitcast double* %31 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %32, align 8
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %34, align 8
  %index.next.1 = add i64 %index, 8
  %35 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %36, align 8
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %38, align 8
  %index.next.2 = add i64 %index, 12
  %39 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %40, align 8
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %42, align 8
  %index.next.3 = add i64 %index, 16
  %43 = getelementptr inbounds double, double* %5, i64 %index.next.3
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %44, align 8
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %46, align 8
  %index.next.4 = add i64 %index, 20
  %47 = getelementptr inbounds double, double* %5, i64 %index.next.4
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %48, align 8
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %50, align 8
  %index.next.5 = add i64 %index, 24
  %51 = getelementptr inbounds double, double* %5, i64 %index.next.5
  %52 = bitcast double* %51 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %52, align 8
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %54, align 8
  %index.next.6 = add i64 %index, 28
  %55 = getelementptr inbounds double, double* %5, i64 %index.next.6
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %56, align 8
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  store <2 x double> %broadcast.splat204, <2 x double>* %58, align 8
  %index.next.7 = add i64 %index, 32
  %59 = icmp eq i64 %index.next.7, %n.vec
  br i1 %59, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %smax201, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph64.split.preheader209

.lr.ph64.split.us.preheader:                      ; preds = %.lr.ph64
  %60 = add i32 %1, -1
  %xtraiter138 = and i32 %1, 3
  %61 = icmp eq i32 %xtraiter138, 0
  %62 = icmp ult i32 %60, 3
  %sunkaddr179 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  br label %.lr.ph64.split.us

.lr.ph64.split.us:                                ; preds = %._crit_edge60.us, %.lr.ph64.split.us.preheader
  %indvars.iv140 = phi i64 [ 0, %.lr.ph64.split.us.preheader ], [ %indvars.iv.next141, %._crit_edge60.us ]
  %63 = getelementptr inbounds double, double* %5, i64 %indvars.iv140
  store double 0.000000e+00, double* %63, align 8
  br i1 %61, label %.prol.loopexit137, label %.prol.preheader136.preheader

.prol.preheader136.preheader:                     ; preds = %.lr.ph64.split.us
  %sunkaddr176 = shl i64 %indvars.iv140, 3
  %sunkaddr177 = add i64 %sunkaddr, %sunkaddr176
  %sunkaddr178 = inttoptr i64 %sunkaddr177 to double*
  br label %.prol.preheader136

.prol.preheader136:                               ; preds = %.prol.preheader136.preheader, %.prol.preheader136
  %indvars.iv132.prol = phi i64 [ %indvars.iv.next133.prol, %.prol.preheader136 ], [ 0, %.prol.preheader136.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader136 ], [ %xtraiter138, %.prol.preheader136.preheader ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv132.prol, i64 %indvars.iv140
  %65 = load double, double* %64, align 8
  %66 = load double, double* %sunkaddr178, align 8
  %67 = fadd double %65, %66
  store double %67, double* %sunkaddr178, align 8
  %indvars.iv.next133.prol = add nuw nsw i64 %indvars.iv132.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit137.loopexit, label %.prol.preheader136, !llvm.loop !6

.prol.loopexit137.loopexit:                       ; preds = %.prol.preheader136
  br label %.prol.loopexit137

.prol.loopexit137:                                ; preds = %.prol.loopexit137.loopexit, %.lr.ph64.split.us
  %indvars.iv132.unr = phi i64 [ 0, %.lr.ph64.split.us ], [ %indvars.iv.next133.prol, %.prol.loopexit137.loopexit ]
  br i1 %62, label %._crit_edge60.us, label %.lr.ph64.split.us.new.preheader

.lr.ph64.split.us.new.preheader:                  ; preds = %.prol.loopexit137
  %sunkaddr180 = shl i64 %indvars.iv140, 3
  %sunkaddr181 = add i64 %sunkaddr179, %sunkaddr180
  %sunkaddr182 = inttoptr i64 %sunkaddr181 to double*
  br label %.lr.ph64.split.us.new

.lr.ph64.split.us.new:                            ; preds = %.lr.ph64.split.us.new.preheader, %.lr.ph64.split.us.new
  %indvars.iv132 = phi i64 [ %indvars.iv.next133.3, %.lr.ph64.split.us.new ], [ %indvars.iv132.unr, %.lr.ph64.split.us.new.preheader ]
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv132, i64 %indvars.iv140
  %69 = load double, double* %68, align 8
  %70 = load double, double* %sunkaddr182, align 8
  %71 = fadd double %69, %70
  store double %71, double* %sunkaddr182, align 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next133, i64 %indvars.iv140
  %73 = load double, double* %72, align 8
  %74 = fadd double %73, %71
  store double %74, double* %sunkaddr182, align 8
  %indvars.iv.next133.1 = add nsw i64 %indvars.iv132, 2
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next133.1, i64 %indvars.iv140
  %76 = load double, double* %75, align 8
  %77 = fadd double %76, %74
  store double %77, double* %sunkaddr182, align 8
  %indvars.iv.next133.2 = add nsw i64 %indvars.iv132, 3
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next133.2, i64 %indvars.iv140
  %79 = load double, double* %78, align 8
  %80 = fadd double %79, %77
  store double %80, double* %sunkaddr182, align 8
  %indvars.iv.next133.3 = add nsw i64 %indvars.iv132, 4
  %exitcond135.3 = icmp eq i64 %indvars.iv.next133.3, %wide.trip.count134.3
  br i1 %exitcond135.3, label %._crit_edge60.us.loopexit, label %.lr.ph64.split.us.new

._crit_edge60.us.loopexit:                        ; preds = %.lr.ph64.split.us.new
  br label %._crit_edge60.us

._crit_edge60.us:                                 ; preds = %._crit_edge60.us.loopexit, %.prol.loopexit137
  %81 = load double, double* %63, align 8
  %82 = fdiv double %81, %2
  store double %82, double* %63, align 8
  %indvars.iv.next141 = add nsw i64 %indvars.iv140, 1
  %83 = icmp slt i64 %indvars.iv.next141, %16
  br i1 %83, label %.lr.ph64.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge60.us
  br label %._crit_edge

._crit_edge.loopexit210:                          ; preds = %.lr.ph64.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit210, %._crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph53, label %._crit_edge.._crit_edge9_crit_edge

._crit_edge.._crit_edge9_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge9

.lr.ph53:                                         ; preds = %._crit_edge
  %84 = load double*, double** %12, align 8
  %85 = load double, double* %8, align 8
  %86 = load double, double* %13, align 8
  %87 = load [1200 x double]*, [1200 x double]** %9, align 8
  %88 = load double*, double** %11, align 8
  %89 = ptrtoint double* %84 to i64
  %90 = sext i32 %1 to i64
  br i1 %15, label %.lr.ph53.split.us.preheader, label %.lr.ph53.split.preheader

.lr.ph53.split.preheader:                         ; preds = %.lr.ph53
  %91 = fdiv double 0.000000e+00, %85
  br label %.lr.ph53.split

.lr.ph53.split.us.preheader:                      ; preds = %.lr.ph53
  %xtraiter213 = and i64 %90, 1
  %lcmp.mod = icmp eq i64 %xtraiter213, 0
  %sunkaddr183.prol = ptrtoint double* %88 to i64
  %92 = icmp eq i32 %1, 1
  %sunkaddr183 = ptrtoint double* %88 to i64
  %sunkaddr183.1 = ptrtoint double* %88 to i64
  br label %.lr.ph53.split.us

.lr.ph53.split.us:                                ; preds = %._crit_edge10.us, %.lr.ph53.split.us.preheader
  %indvars.iv126 = phi i64 [ 0, %.lr.ph53.split.us.preheader ], [ %indvars.iv.next127, %._crit_edge10.us ]
  %93 = getelementptr inbounds double, double* %84, i64 %indvars.iv126
  store double 0.000000e+00, double* %93, align 8
  br i1 %lcmp.mod, label %.prol.loopexit212.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph53.split.us
  br label %94

; <label>:94:                                     ; preds = %.prol.preheader
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %87, i64 0, i64 %indvars.iv126
  %96 = load double, double* %95, align 8
  %sunkaddr184.prol = shl i64 %indvars.iv126, 3
  %sunkaddr185.prol = add i64 %sunkaddr183.prol, %sunkaddr184.prol
  %sunkaddr186.prol = inttoptr i64 %sunkaddr185.prol to double*
  %97 = load double, double* %sunkaddr186.prol, align 8
  %98 = fsub double %96, %97
  %99 = fmul double %98, %98
  %sunkaddr192.prol = add i64 %89, %sunkaddr184.prol
  %sunkaddr193.prol = inttoptr i64 %sunkaddr192.prol to double*
  %100 = load double, double* %sunkaddr193.prol, align 8
  %101 = fadd double %99, %100
  store double %101, double* %sunkaddr193.prol, align 8
  br label %.prol.loopexit212.unr-lcssa

.prol.loopexit212.unr-lcssa:                      ; preds = %.lr.ph53.split.us, %94
  %indvars.iv123.unr.ph = phi i64 [ 1, %94 ], [ 0, %.lr.ph53.split.us ]
  br label %.prol.loopexit212

.prol.loopexit212:                                ; preds = %.prol.loopexit212.unr-lcssa
  br i1 %92, label %._crit_edge50.us, label %.lr.ph53.split.us.new

.lr.ph53.split.us.new:                            ; preds = %.prol.loopexit212
  %sunkaddr184 = shl i64 %indvars.iv126, 3
  %sunkaddr185 = add i64 %sunkaddr183, %sunkaddr184
  %sunkaddr186 = inttoptr i64 %sunkaddr185 to double*
  %sunkaddr192 = add i64 %89, %sunkaddr184
  %sunkaddr193 = inttoptr i64 %sunkaddr192 to double*
  %sunkaddr184.1 = shl i64 %indvars.iv126, 3
  %sunkaddr185.1 = add i64 %sunkaddr183.1, %sunkaddr184.1
  %sunkaddr186.1 = inttoptr i64 %sunkaddr185.1 to double*
  %sunkaddr192.1 = add i64 %89, %sunkaddr184.1
  %sunkaddr193.1 = inttoptr i64 %sunkaddr192.1 to double*
  br label %105

; <label>:102:                                    ; preds = %._crit_edge50.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge50.us, %102
  %103 = phi double [ %123, %102 ], [ 1.000000e+00, %._crit_edge50.us ]
  store double %103, double* %93, align 8
  %indvars.iv.next127 = add nsw i64 %indvars.iv126, 1
  %104 = icmp slt i64 %indvars.iv.next127, %16
  br i1 %104, label %.lr.ph53.split.us, label %.._crit_edge9_crit_edge.loopexit

; <label>:105:                                    ; preds = %105, %.lr.ph53.split.us.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr.ph, %.lr.ph53.split.us.new ], [ %indvars.iv.next124.1, %105 ]
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %87, i64 %indvars.iv123, i64 %indvars.iv126
  %107 = load double, double* %106, align 8
  %108 = load double, double* %sunkaddr186, align 8
  %109 = fsub double %107, %108
  %110 = fmul double %109, %109
  %111 = load double, double* %sunkaddr193, align 8
  %112 = fadd double %110, %111
  store double %112, double* %sunkaddr193, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %87, i64 %indvars.iv.next124, i64 %indvars.iv126
  %114 = load double, double* %113, align 8
  %115 = load double, double* %sunkaddr186.1, align 8
  %116 = fsub double %114, %115
  %117 = fmul double %116, %116
  %118 = load double, double* %sunkaddr193.1, align 8
  %119 = fadd double %117, %118
  store double %119, double* %sunkaddr193.1, align 8
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  %120 = icmp slt i64 %indvars.iv.next124.1, %90
  br i1 %120, label %105, label %._crit_edge50.us.unr-lcssa

._crit_edge50.us.unr-lcssa:                       ; preds = %105
  br label %._crit_edge50.us

._crit_edge50.us:                                 ; preds = %.prol.loopexit212, %._crit_edge50.us.unr-lcssa
  %121 = load double, double* %93, align 8
  %122 = fdiv double %121, %85
  store double %122, double* %93, align 8
  %123 = tail call double @sqrt(double %122) #3
  store double %123, double* %93, align 8
  %124 = fcmp ugt double %123, %86
  br i1 %124, label %102, label %._crit_edge10.us

.lr.ph64.split:                                   ; preds = %.lr.ph64.split.preheader209, %.lr.ph64.split
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %.lr.ph64.split ], [ %indvars.iv144.ph, %.lr.ph64.split.preheader209 ]
  %125 = getelementptr inbounds double, double* %5, i64 %indvars.iv144
  store double %17, double* %125, align 8
  %indvars.iv.next145 = add nsw i64 %indvars.iv144, 1
  %126 = icmp slt i64 %indvars.iv.next145, %16
  br i1 %126, label %.lr.ph64.split, label %._crit_edge.loopexit210, !llvm.loop !7

.._crit_edge9_crit_edge.loopexit:                 ; preds = %._crit_edge10.us
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge.loopexit208:              ; preds = %._crit_edge10
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge:                          ; preds = %.._crit_edge9_crit_edge.loopexit208, %.._crit_edge9_crit_edge.loopexit
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge.._crit_edge9_crit_edge, %._crit_edge.thread, %.._crit_edge9_crit_edge
  %127 = icmp sgt i32 %1, 0
  br i1 %127, label %._crit_edge11.lr.ph, label %._crit_edge12

._crit_edge11.lr.ph:                              ; preds = %._crit_edge9
  %128 = sext i32 %1 to i64
  %129 = load double*, double** %11, align 8
  %130 = load [1200 x double]*, [1200 x double]** %9, align 8
  %131 = load double, double* %8, align 8
  %132 = load double*, double** %12, align 8
  %133 = sext i32 %0 to i64
  br i1 %14, label %._crit_edge11.us.preheader, label %.._crit_edge12_crit_edge.loopexit70

._crit_edge11.us.preheader:                       ; preds = %._crit_edge11.lr.ph
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge43.us, %._crit_edge11.us.preheader
  %indvars.iv121 = phi i64 [ 0, %._crit_edge11.us.preheader ], [ %indvars.iv.next122, %._crit_edge43.us ]
  br label %134

; <label>:134:                                    ; preds = %134, %._crit_edge11.us
  %indvars.iv119 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next120, %134 ]
  %135 = getelementptr inbounds double, double* %129, i64 %indvars.iv119
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %130, i64 %indvars.iv121, i64 %indvars.iv119
  %138 = load double, double* %137, align 8
  %139 = fsub double %138, %136
  store double %139, double* %137, align 8
  %140 = tail call double @sqrt(double %131) #3
  %141 = getelementptr inbounds double, double* %132, i64 %indvars.iv119
  %142 = load double, double* %141, align 8
  %143 = fmul double %140, %142
  %144 = load double, double* %137, align 8
  %145 = fdiv double %144, %143
  store double %145, double* %137, align 8
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %146 = icmp slt i64 %indvars.iv.next120, %133
  br i1 %146, label %134, label %._crit_edge43.us

._crit_edge43.us:                                 ; preds = %134
  %indvars.iv.next122 = add nsw i64 %indvars.iv121, 1
  %147 = icmp slt i64 %indvars.iv.next122, %128
  br i1 %147, label %._crit_edge11.us, label %.._crit_edge12_crit_edge.loopexit

.lr.ph53.split:                                   ; preds = %._crit_edge10, %.lr.ph53.split.preheader
  %indvars.iv129 = phi i64 [ 0, %.lr.ph53.split.preheader ], [ %indvars.iv.next130, %._crit_edge10 ]
  %148 = getelementptr inbounds double, double* %84, i64 %indvars.iv129
  store double %91, double* %148, align 8
  %149 = tail call double @sqrt(double %91) #3
  store double %149, double* %148, align 8
  %150 = fcmp ugt double %149, %86
  br i1 %150, label %151, label %._crit_edge10

; <label>:151:                                    ; preds = %.lr.ph53.split
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.lr.ph53.split, %151
  %152 = phi double [ %149, %151 ], [ 1.000000e+00, %.lr.ph53.split ]
  store double %152, double* %148, align 8
  %indvars.iv.next130 = add nsw i64 %indvars.iv129, 1
  %153 = icmp slt i64 %indvars.iv.next130, %16
  br i1 %153, label %.lr.ph53.split, label %.._crit_edge9_crit_edge.loopexit208

.._crit_edge12_crit_edge.loopexit:                ; preds = %._crit_edge43.us
  br label %.._crit_edge12_crit_edge

.._crit_edge12_crit_edge.loopexit70:              ; preds = %._crit_edge11.lr.ph
  br label %.._crit_edge12_crit_edge

.._crit_edge12_crit_edge:                         ; preds = %.._crit_edge12_crit_edge.loopexit70, %.._crit_edge12_crit_edge.loopexit
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge9, %.._crit_edge12_crit_edge
  %154 = icmp sgt i32 %0, 1
  %155 = load [1200 x double]*, [1200 x double]** %10, align 8
  br i1 %154, label %.lr.ph23, label %._crit_edge12.._crit_edge12._crit_edge_crit_edge

._crit_edge12.._crit_edge12._crit_edge_crit_edge: ; preds = %._crit_edge12
  %.pre = sext i32 %0 to i64
  %.pre205 = add nsw i64 %.pre, -1
  br label %._crit_edge12._crit_edge

.lr.ph23:                                         ; preds = %._crit_edge12
  %156 = sext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %157 = load [1200 x double]*, [1200 x double]** %9, align 8
  %158 = add nsw i64 %156, -1
  br i1 %127, label %.lr.ph23.split.us.preheader, label %.lr.ph23.split.preheader

.lr.ph23.split.preheader:                         ; preds = %.lr.ph23
  %159 = add i32 %0, -2
  %160 = add i32 %0, 1
  %161 = zext i32 %160 to i64
  %162 = zext i32 %159 to i64
  br label %.lr.ph23.split

.lr.ph23.split.us.preheader:                      ; preds = %.lr.ph23
  %sext = shl i64 %158, 32
  %163 = ashr exact i64 %sext, 32
  %xtraiter = and i32 %1, 1
  %164 = icmp eq i32 %xtraiter, 0
  %165 = icmp eq i32 %1, 1
  %sunkaddr194 = ptrtoint [1200 x double]* %157 to i64
  br label %.lr.ph23.split.us

.lr.ph23.split.us:                                ; preds = %._crit_edge19.us-lcssa.us.us, %.lr.ph23.split.us.preheader
  %indvars.iv96 = phi i64 [ 0, %.lr.ph23.split.us.preheader ], [ %indvars.iv.next97, %._crit_edge19.us-lcssa.us.us ]
  %indvars.iv87 = phi i64 [ 1, %.lr.ph23.split.us.preheader ], [ %indvars.iv.next88, %._crit_edge19.us-lcssa.us.us ]
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %indvars.iv96, i64 %indvars.iv96
  store double 1.000000e+00, double* %166, align 8
  %indvars.iv.next97 = add nsw i64 %indvars.iv96, 1
  %167 = icmp slt i64 %indvars.iv.next97, %156
  br i1 %167, label %.lr.ph.us.us.preheader, label %._crit_edge19.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph23.split.us
  %sunkaddr195 = shl i64 %indvars.iv96, 3
  %sunkaddr196 = add i64 %sunkaddr194, %sunkaddr195
  %sunkaddr197 = inttoptr i64 %sunkaddr196 to double*
  br label %.lr.ph.us.us

._crit_edge19.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge14.us.us
  br label %._crit_edge19.us-lcssa.us.us

._crit_edge19.us-lcssa.us.us:                     ; preds = %._crit_edge19.us-lcssa.us.us.loopexit, %.lr.ph23.split.us
  %168 = icmp slt i64 %indvars.iv.next97, %163
  %indvars.iv.next88 = add nsw i64 %indvars.iv87, 1
  br i1 %168, label %.lr.ph23.split.us, label %._crit_edge24.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge14.us.us
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %._crit_edge14.us.us ], [ %indvars.iv87, %.lr.ph.us.us.preheader ]
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %indvars.iv96, i64 %indvars.iv89
  store double 0.000000e+00, double* %169, align 8
  br i1 %164, label %.prol.loopexit, label %170

; <label>:170:                                    ; preds = %.lr.ph.us.us
  %171 = load double, double* %sunkaddr197, align 8
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %157, i64 0, i64 %indvars.iv89
  %173 = load double, double* %172, align 8
  %174 = fmul double %171, %173
  %175 = fadd double %174, 0.000000e+00
  store double %175, double* %169, align 8
  %176 = bitcast double %175 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %170
  %177 = phi i64 [ %176, %170 ], [ 0, %.lr.ph.us.us ]
  %178 = phi double [ %175, %170 ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %170 ], [ 0, %.lr.ph.us.us ]
  br i1 %165, label %._crit_edge14.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge14.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %179 = bitcast double %195 to i64
  br label %._crit_edge14.us.us

._crit_edge14.us.us:                              ; preds = %._crit_edge14.us.us.loopexit, %.prol.loopexit
  %180 = phi i64 [ %177, %.prol.loopexit ], [ %179, %._crit_edge14.us.us.loopexit ]
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %indvars.iv89, i64 %indvars.iv96
  %182 = bitcast double* %181 to i64*
  store i64 %180, i64* %182, align 8
  %indvars.iv.next90 = add nsw i64 %indvars.iv89, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next90 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond, label %._crit_edge19.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %183 = phi double [ %195, %.lr.ph.us.us.new ], [ %178, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %157, i64 %indvars.iv, i64 %indvars.iv96
  %185 = load double, double* %184, align 8
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %157, i64 %indvars.iv, i64 %indvars.iv89
  %187 = load double, double* %186, align 8
  %188 = fmul double %185, %187
  %189 = fadd double %188, %183
  store double %189, double* %169, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %190 = getelementptr inbounds [1200 x double], [1200 x double]* %157, i64 %indvars.iv.next, i64 %indvars.iv96
  %191 = load double, double* %190, align 8
  %192 = getelementptr inbounds [1200 x double], [1200 x double]* %157, i64 %indvars.iv.next, i64 %indvars.iv89
  %193 = load double, double* %192, align 8
  %194 = fmul double %191, %193
  %195 = fadd double %194, %189
  store double %195, double* %169, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge14.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph23.split:                                   ; preds = %._crit_edge19, %.lr.ph23.split.preheader
  %indvars.iv115 = phi i64 [ 0, %.lr.ph23.split.preheader ], [ %indvars.iv.next116, %._crit_edge19 ]
  %indvar = phi i64 [ 0, %.lr.ph23.split.preheader ], [ %indvar.next, %._crit_edge19 ]
  %indvars.iv100 = phi i64 [ 1, %.lr.ph23.split.preheader ], [ %indvars.iv.next101, %._crit_edge19 ]
  %196 = sub i64 %162, %indvar
  %197 = trunc i64 %196 to i32
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %indvars.iv115, i64 %indvars.iv115
  store double 1.000000e+00, double* %198, align 8
  %indvars.iv.next116 = add nsw i64 %indvars.iv115, 1
  %199 = icmp slt i64 %indvars.iv.next116, %156
  br i1 %199, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %.lr.ph23.split
  %200 = sub i64 %161, %indvar
  %xtraiter113167 = and i64 %200, 1
  %lcmp.mod114 = icmp eq i64 %xtraiter113167, 0
  br i1 %lcmp.mod114, label %.prol.loopexit112, label %201

; <label>:201:                                    ; preds = %.lr.ph18
  %202 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %indvars.iv115, i64 %indvars.iv100
  store double 0.000000e+00, double* %202, align 8
  %203 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %indvars.iv100, i64 %indvars.iv115
  %204 = bitcast double* %203 to i64*
  store i64 0, i64* %204, align 8
  %indvars.iv.next103.prol = add nsw i64 %indvars.iv100, 1
  br label %.prol.loopexit112

.prol.loopexit112:                                ; preds = %.lr.ph18, %201
  %indvars.iv102.unr.ph = phi i64 [ %indvars.iv.next103.prol, %201 ], [ %indvars.iv100, %.lr.ph18 ]
  %205 = icmp eq i32 %197, 0
  br i1 %205, label %._crit_edge19, label %.lr.ph18.new.preheader

.lr.ph18.new.preheader:                           ; preds = %.prol.loopexit112
  br label %.lr.ph18.new

.lr.ph18.new:                                     ; preds = %.lr.ph18.new.preheader, %.lr.ph18.new
  %indvars.iv102 = phi i64 [ %indvars.iv.next103.1, %.lr.ph18.new ], [ %indvars.iv102.unr.ph, %.lr.ph18.new.preheader ]
  %206 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %indvars.iv115, i64 %indvars.iv102
  store double 0.000000e+00, double* %206, align 8
  %207 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %indvars.iv102, i64 %indvars.iv115
  %208 = bitcast double* %207 to i64*
  store i64 0, i64* %208, align 8
  %indvars.iv.next103 = add nsw i64 %indvars.iv102, 1
  %209 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %indvars.iv115, i64 %indvars.iv.next103
  store double 0.000000e+00, double* %209, align 8
  %210 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %indvars.iv.next103, i64 %indvars.iv115
  %211 = bitcast double* %210 to i64*
  store i64 0, i64* %211, align 8
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  %lftr.wideiv108.1 = trunc i64 %indvars.iv.next103.1 to i32
  %exitcond109.1 = icmp eq i32 %lftr.wideiv108.1, %0
  br i1 %exitcond109.1, label %._crit_edge19.loopexit, label %.lr.ph18.new

._crit_edge19.loopexit:                           ; preds = %.lr.ph18.new
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %.prol.loopexit112, %.lr.ph23.split
  %212 = icmp slt i64 %indvars.iv.next116, %158
  %indvars.iv.next101 = add nsw i64 %indvars.iv100, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %212, label %.lr.ph23.split, label %._crit_edge24.loopexit207

._crit_edge24.loopexit:                           ; preds = %._crit_edge19.us-lcssa.us.us
  br label %._crit_edge24

._crit_edge24.loopexit207:                        ; preds = %._crit_edge19
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit207, %._crit_edge24.loopexit
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12.._crit_edge12._crit_edge_crit_edge, %._crit_edge24
  %.pre-phi206 = phi i64 [ %.pre205, %._crit_edge12.._crit_edge12._crit_edge_crit_edge ], [ %158, %._crit_edge24 ]
  %213 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %.pre-phi206, i64 %.pre-phi206
  store double 1.000000e+00, double* %213, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.lr.ph, label %._crit_edge

._crit_edge.lr.ph:                                ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  %8 = sext i32 %0 to i64
  br i1 true, label %._crit_edge.us.preheader, label %._crit_edge5.loopexit9

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge3.us, %._crit_edge.us.preheader
  %indvars.iv11 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next12, %._crit_edge3.us ]
  %9 = mul nsw i64 %8, %indvars.iv11
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %11 = add nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge2.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #4
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge3.us, label %10

._crit_edge3.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %21 = icmp slt i64 %indvars.iv.next12, %8
  br i1 %21, label %._crit_edge.us, label %._crit_edge5.loopexit

._crit_edge5.loopexit:                            ; preds = %._crit_edge3.us
  br label %._crit_edge5

._crit_edge5.loopexit9:                           ; preds = %._crit_edge.lr.ph
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit9, %._crit_edge5.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %._crit_edge5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !8, !4, !5}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
