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
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]*) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %22, %4
  %indvars.iv5 = phi i64 [ 0, %4 ], [ %indvars.iv.next6, %22 ]
  %5 = trunc i64 %indvars.iv5 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %9, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv, %indvars.iv5
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv5
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.200000e+03>
  %20 = fadd <2 x double> %8, %19
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %22, label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1400
  br i1 %exitcond, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph64, label %._crit_edge9

.lr.ph64:                                         ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph64.split.us.preheader, label %.lr.ph64.split.preheader

.lr.ph64.split.preheader:                         ; preds = %.lr.ph64
  %10 = sext i32 %0 to i64
  %11 = fdiv double 0.000000e+00, %2
  %min.iters.check = icmp ult i32 %0, 4
  br i1 %min.iters.check, label %.lr.ph64.split.preheader168, label %min.iters.checked

.lr.ph64.split.preheader168:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph64.split.preheader
  %indvars.iv144.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph64.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph64.split

min.iters.checked:                                ; preds = %.lr.ph64.split.preheader
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph64.split.preheader168, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert163 = insertelement <2 x double> undef, double %11, i32 0
  %broadcast.splat164 = shufflevector <2 x double> %broadcast.splatinsert163, <2 x double> undef, <2 x i32> zeroinitializer
  %12 = add nsw i64 %n.vec, -4
  %13 = lshr exact i64 %12, 2
  %14 = add nuw nsw i64 %13, 1
  %xtraiter177 = and i64 %14, 7
  %lcmp.mod178 = icmp eq i64 %xtraiter177, 0
  br i1 %lcmp.mod178, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %prol.iter179 = phi i64 [ %xtraiter177, %vector.body.prol.preheader ], [ %prol.iter179.sub, %vector.body.prol ]
  %15 = getelementptr inbounds double, double* %5, i64 %index.prol
  %16 = bitcast double* %15 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %18, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter179.sub = add i64 %prol.iter179, -1
  %prol.iter179.cmp = icmp eq i64 %prol.iter179.sub, 0
  br i1 %prol.iter179.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.ph, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %19 = icmp ult i64 %12, 28
  br i1 %19, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr, %vector.ph.new ], [ %index.next.7, %vector.body ]
  %20 = getelementptr inbounds double, double* %5, i64 %index
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %21, align 8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %23, align 8
  %index.next = add i64 %index, 4
  %24 = getelementptr inbounds double, double* %5, i64 %index.next
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %27, align 8
  %index.next.1 = add i64 %index, 8
  %28 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %29 = bitcast double* %28 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %29, align 8
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %31, align 8
  %index.next.2 = add i64 %index, 12
  %32 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %33, align 8
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %35, align 8
  %index.next.3 = add i64 %index, 16
  %36 = getelementptr inbounds double, double* %5, i64 %index.next.3
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %37, align 8
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %39, align 8
  %index.next.4 = add i64 %index, 20
  %40 = getelementptr inbounds double, double* %5, i64 %index.next.4
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %41, align 8
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %43, align 8
  %index.next.5 = add i64 %index, 24
  %44 = getelementptr inbounds double, double* %5, i64 %index.next.5
  %45 = bitcast double* %44 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %45, align 8
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %47, align 8
  %index.next.6 = add i64 %index, 28
  %48 = getelementptr inbounds double, double* %5, i64 %index.next.6
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %49, align 8
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  store <2 x double> %broadcast.splat164, <2 x double>* %51, align 8
  %index.next.7 = add i64 %index, 32
  %52 = icmp eq i64 %index.next.7, %n.vec
  br i1 %52, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %10, %n.vec
  br i1 %cmp.n, label %.lr.ph53, label %.lr.ph64.split.preheader168

.lr.ph64.split.us.preheader:                      ; preds = %.lr.ph64
  %53 = add i32 %1, -1
  %54 = sext i32 %0 to i64
  %xtraiter138 = and i32 %1, 3
  %lcmp.mod139 = icmp eq i32 %xtraiter138, 0
  %55 = icmp ult i32 %53, 3
  %wide.trip.count134.3 = zext i32 %1 to i64
  br label %.lr.ph64.split.us

.lr.ph64.split.us:                                ; preds = %.lr.ph64.split.us.preheader, %._crit_edge60.us
  %indvars.iv140 = phi i64 [ 0, %.lr.ph64.split.us.preheader ], [ %indvars.iv.next141, %._crit_edge60.us ]
  %56 = getelementptr inbounds double, double* %5, i64 %indvars.iv140
  store double 0.000000e+00, double* %56, align 8
  br i1 %lcmp.mod139, label %.prol.loopexit137, label %.prol.preheader136.preheader

.prol.preheader136.preheader:                     ; preds = %.lr.ph64.split.us
  br label %.prol.preheader136

.prol.preheader136:                               ; preds = %.prol.preheader136.preheader, %.prol.preheader136
  %57 = phi double [ %60, %.prol.preheader136 ], [ 0.000000e+00, %.prol.preheader136.preheader ]
  %indvars.iv132.prol = phi i64 [ %indvars.iv.next133.prol, %.prol.preheader136 ], [ 0, %.prol.preheader136.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader136 ], [ %xtraiter138, %.prol.preheader136.preheader ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv132.prol, i64 %indvars.iv140
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %57
  store double %60, double* %56, align 8
  %indvars.iv.next133.prol = add nuw nsw i64 %indvars.iv132.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit137.loopexit, label %.prol.preheader136, !llvm.loop !6

.prol.loopexit137.loopexit:                       ; preds = %.prol.preheader136
  br label %.prol.loopexit137

.prol.loopexit137:                                ; preds = %.prol.loopexit137.loopexit, %.lr.ph64.split.us
  %61 = phi double [ 0.000000e+00, %.lr.ph64.split.us ], [ %60, %.prol.loopexit137.loopexit ]
  %indvars.iv132.unr = phi i64 [ 0, %.lr.ph64.split.us ], [ %indvars.iv.next133.prol, %.prol.loopexit137.loopexit ]
  br i1 %55, label %._crit_edge60.us, label %.lr.ph64.split.us.new.preheader

.lr.ph64.split.us.new.preheader:                  ; preds = %.prol.loopexit137
  br label %.lr.ph64.split.us.new

.lr.ph64.split.us.new:                            ; preds = %.lr.ph64.split.us.new.preheader, %.lr.ph64.split.us.new
  %62 = phi double [ %74, %.lr.ph64.split.us.new ], [ %61, %.lr.ph64.split.us.new.preheader ]
  %indvars.iv132 = phi i64 [ %indvars.iv.next133.3, %.lr.ph64.split.us.new ], [ %indvars.iv132.unr, %.lr.ph64.split.us.new.preheader ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv132, i64 %indvars.iv140
  %64 = load double, double* %63, align 8
  %65 = fadd double %64, %62
  store double %65, double* %56, align 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next133, i64 %indvars.iv140
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %56, align 8
  %indvars.iv.next133.1 = add nsw i64 %indvars.iv132, 2
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next133.1, i64 %indvars.iv140
  %70 = load double, double* %69, align 8
  %71 = fadd double %70, %68
  store double %71, double* %56, align 8
  %indvars.iv.next133.2 = add nsw i64 %indvars.iv132, 3
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next133.2, i64 %indvars.iv140
  %73 = load double, double* %72, align 8
  %74 = fadd double %73, %71
  store double %74, double* %56, align 8
  %indvars.iv.next133.3 = add nsw i64 %indvars.iv132, 4
  %exitcond135.3 = icmp eq i64 %indvars.iv.next133.3, %wide.trip.count134.3
  br i1 %exitcond135.3, label %._crit_edge60.us.loopexit, label %.lr.ph64.split.us.new

._crit_edge60.us.loopexit:                        ; preds = %.lr.ph64.split.us.new
  br label %._crit_edge60.us

._crit_edge60.us:                                 ; preds = %._crit_edge60.us.loopexit, %.prol.loopexit137
  %75 = phi double [ %61, %.prol.loopexit137 ], [ %74, %._crit_edge60.us.loopexit ]
  %76 = fdiv double %75, %2
  store double %76, double* %56, align 8
  %indvars.iv.next141 = add nsw i64 %indvars.iv140, 1
  %77 = icmp slt i64 %indvars.iv.next141, %54
  br i1 %77, label %.lr.ph64.split.us, label %.lr.ph53.loopexit

.lr.ph53.loopexit:                                ; preds = %._crit_edge60.us
  br label %.lr.ph53

.lr.ph53.loopexit169:                             ; preds = %.lr.ph64.split
  br label %.lr.ph53

.lr.ph53:                                         ; preds = %.lr.ph53.loopexit169, %.lr.ph53.loopexit, %middle.block
  br i1 %9, label %.lr.ph53.split.us.preheader, label %.lr.ph53.split.preheader

.lr.ph53.split.preheader:                         ; preds = %.lr.ph53
  %78 = sext i32 %0 to i64
  %79 = fdiv double 0.000000e+00, %2
  br label %.lr.ph53.split

.lr.ph53.split.us.preheader:                      ; preds = %.lr.ph53
  %80 = sext i32 %1 to i64
  %81 = sext i32 %0 to i64
  %xtraiter175 = and i64 %80, 1
  %lcmp.mod176 = icmp eq i64 %xtraiter175, 0
  %82 = icmp eq i32 %1, 1
  br label %.lr.ph53.split.us

.lr.ph53.split.us:                                ; preds = %.lr.ph53.split.us.preheader, %._crit_edge50.us
  %indvars.iv126 = phi i64 [ 0, %.lr.ph53.split.us.preheader ], [ %indvars.iv.next127, %._crit_edge50.us ]
  %83 = getelementptr inbounds double, double* %6, i64 %indvars.iv126
  store double 0.000000e+00, double* %83, align 8
  %84 = getelementptr inbounds double, double* %5, i64 %indvars.iv126
  br i1 %lcmp.mod176, label %.prol.loopexit174.unr-lcssa, label %.prol.preheader173

.prol.preheader173:                               ; preds = %.lr.ph53.split.us
  br label %85

; <label>:85:                                     ; preds = %.prol.preheader173
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv126
  %87 = load double, double* %86, align 8
  %88 = load double, double* %84, align 8
  %89 = fsub double %87, %88
  %90 = fmul double %89, %89
  %91 = fadd double %90, 0.000000e+00
  store double %91, double* %83, align 8
  br label %.prol.loopexit174.unr-lcssa

.prol.loopexit174.unr-lcssa:                      ; preds = %.lr.ph53.split.us, %85
  %.unr.ph = phi double [ %91, %85 ], [ 0.000000e+00, %.lr.ph53.split.us ]
  %indvars.iv123.unr.ph = phi i64 [ 1, %85 ], [ 0, %.lr.ph53.split.us ]
  %.lcssa170.unr.ph = phi double [ %91, %85 ], [ undef, %.lr.ph53.split.us ]
  br label %.prol.loopexit174

.prol.loopexit174:                                ; preds = %.prol.loopexit174.unr-lcssa
  br i1 %82, label %._crit_edge50.us, label %.lr.ph53.split.us.new

.lr.ph53.split.us.new:                            ; preds = %.prol.loopexit174
  br label %92

; <label>:92:                                     ; preds = %92, %.lr.ph53.split.us.new
  %93 = phi double [ %.unr.ph, %.lr.ph53.split.us.new ], [ %105, %92 ]
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr.ph, %.lr.ph53.split.us.new ], [ %indvars.iv.next124.1, %92 ]
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %indvars.iv126
  %95 = load double, double* %94, align 8
  %96 = load double, double* %84, align 8
  %97 = fsub double %95, %96
  %98 = fmul double %97, %97
  %99 = fadd double %98, %93
  store double %99, double* %83, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next124, i64 %indvars.iv126
  %101 = load double, double* %100, align 8
  %102 = load double, double* %84, align 8
  %103 = fsub double %101, %102
  %104 = fmul double %103, %103
  %105 = fadd double %104, %99
  store double %105, double* %83, align 8
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  %106 = icmp slt i64 %indvars.iv.next124.1, %80
  br i1 %106, label %92, label %._crit_edge50.us.unr-lcssa

._crit_edge50.us.unr-lcssa:                       ; preds = %92
  br label %._crit_edge50.us

._crit_edge50.us:                                 ; preds = %.prol.loopexit174, %._crit_edge50.us.unr-lcssa
  %.lcssa170 = phi double [ %.lcssa170.unr.ph, %.prol.loopexit174 ], [ %105, %._crit_edge50.us.unr-lcssa ]
  %107 = fdiv double %.lcssa170, %2
  store double %107, double* %83, align 8
  %108 = tail call double @sqrt(double %107) #4
  %109 = fcmp ugt double %108, 1.000000e-01
  %110 = select i1 %109, double %108, double 1.000000e+00
  store double %110, double* %83, align 8
  %indvars.iv.next127 = add nsw i64 %indvars.iv126, 1
  %111 = icmp slt i64 %indvars.iv.next127, %81
  br i1 %111, label %.lr.ph53.split.us, label %._crit_edge9.loopexit

.lr.ph64.split:                                   ; preds = %.lr.ph64.split.preheader168, %.lr.ph64.split
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %.lr.ph64.split ], [ %indvars.iv144.ph, %.lr.ph64.split.preheader168 ]
  %112 = getelementptr inbounds double, double* %5, i64 %indvars.iv144
  store double %11, double* %112, align 8
  %indvars.iv.next145 = add nsw i64 %indvars.iv144, 1
  %113 = icmp slt i64 %indvars.iv.next145, %10
  br i1 %113, label %.lr.ph64.split, label %.lr.ph53.loopexit169, !llvm.loop !7

._crit_edge9.loopexit:                            ; preds = %._crit_edge50.us
  br label %._crit_edge9

._crit_edge9.loopexit167:                         ; preds = %.lr.ph53.split
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit167, %._crit_edge9.loopexit, %7
  %114 = icmp sgt i32 %1, 0
  %brmerge.demorgan = and i1 %114, %8
  br i1 %brmerge.demorgan, label %._crit_edge11.us.preheader, label %._crit_edge12

._crit_edge11.us.preheader:                       ; preds = %._crit_edge9
  %115 = sext i32 %0 to i64
  %116 = sext i32 %1 to i64
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge43.us
  %indvars.iv121 = phi i64 [ 0, %._crit_edge11.us.preheader ], [ %indvars.iv.next122, %._crit_edge43.us ]
  br label %117

; <label>:117:                                    ; preds = %._crit_edge11.us, %117
  %indvars.iv119 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next120, %117 ]
  %118 = getelementptr inbounds double, double* %5, i64 %indvars.iv119
  %119 = load double, double* %118, align 8
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %indvars.iv119
  %121 = load double, double* %120, align 8
  %122 = fsub double %121, %119
  store double %122, double* %120, align 8
  %123 = tail call double @sqrt(double %2) #4
  %124 = getelementptr inbounds double, double* %6, i64 %indvars.iv119
  %125 = load double, double* %124, align 8
  %126 = fmul double %123, %125
  %127 = load double, double* %120, align 8
  %128 = fdiv double %127, %126
  store double %128, double* %120, align 8
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %129 = icmp slt i64 %indvars.iv.next120, %115
  br i1 %129, label %117, label %._crit_edge43.us

._crit_edge43.us:                                 ; preds = %117
  %indvars.iv.next122 = add nsw i64 %indvars.iv121, 1
  %130 = icmp slt i64 %indvars.iv.next122, %116
  br i1 %130, label %._crit_edge11.us, label %._crit_edge12.loopexit

.lr.ph53.split:                                   ; preds = %.lr.ph53.split.preheader, %.lr.ph53.split
  %indvars.iv129 = phi i64 [ 0, %.lr.ph53.split.preheader ], [ %indvars.iv.next130, %.lr.ph53.split ]
  %131 = getelementptr inbounds double, double* %6, i64 %indvars.iv129
  store double %79, double* %131, align 8
  %132 = tail call double @sqrt(double %79) #4
  %133 = fcmp ugt double %132, 1.000000e-01
  %134 = select i1 %133, double %132, double 1.000000e+00
  store double %134, double* %131, align 8
  %indvars.iv.next130 = add nsw i64 %indvars.iv129, 1
  %135 = icmp slt i64 %indvars.iv.next130, %78
  br i1 %135, label %.lr.ph53.split, label %._crit_edge9.loopexit167

._crit_edge12.loopexit:                           ; preds = %._crit_edge43.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %._crit_edge9
  %136 = icmp sgt i32 %0, 1
  %137 = add nsw i32 %0, -1
  br i1 %136, label %.lr.ph23, label %._crit_edge12.._crit_edge12._crit_edge_crit_edge

._crit_edge12.._crit_edge12._crit_edge_crit_edge: ; preds = %._crit_edge12
  %.pre = sext i32 %137 to i64
  br label %._crit_edge12._crit_edge

.lr.ph23:                                         ; preds = %._crit_edge12
  br i1 %114, label %.lr.ph23.split.us.preheader, label %.lr.ph23.split.preheader

.lr.ph23.split.preheader:                         ; preds = %.lr.ph23
  %138 = add i32 %0, -2
  %139 = add i32 %0, 1
  %140 = zext i32 %139 to i64
  %141 = zext i32 %138 to i64
  %142 = sext i32 %137 to i64
  %143 = sext i32 %0 to i64
  br label %.lr.ph23.split

.lr.ph23.split.us.preheader:                      ; preds = %.lr.ph23
  %144 = sext i32 %0 to i64
  %145 = sext i32 %137 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %146 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph23.split.us

.lr.ph23.split.us:                                ; preds = %.lr.ph23.split.us.preheader, %._crit_edge19.us-lcssa.us.us
  %indvars.iv96 = phi i64 [ 0, %.lr.ph23.split.us.preheader ], [ %indvars.iv.next97, %._crit_edge19.us-lcssa.us.us ]
  %indvars.iv87 = phi i64 [ 1, %.lr.ph23.split.us.preheader ], [ %indvars.iv.next88, %._crit_edge19.us-lcssa.us.us ]
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv96, i64 %indvars.iv96
  store double 1.000000e+00, double* %147, align 8
  %indvars.iv.next97 = add nsw i64 %indvars.iv96, 1
  %148 = icmp slt i64 %indvars.iv.next97, %144
  br i1 %148, label %.lr.ph.us.us.preheader, label %._crit_edge19.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph23.split.us
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv96
  br label %.lr.ph.us.us

._crit_edge19.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge14.us.us
  br label %._crit_edge19.us-lcssa.us.us

._crit_edge19.us-lcssa.us.us:                     ; preds = %._crit_edge19.us-lcssa.us.us.loopexit, %.lr.ph23.split.us
  %150 = icmp slt i64 %indvars.iv.next97, %145
  %indvars.iv.next88 = add nsw i64 %indvars.iv87, 1
  br i1 %150, label %.lr.ph23.split.us, label %._crit_edge12._crit_edge.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge14.us.us
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %._crit_edge14.us.us ], [ %indvars.iv87, %.lr.ph.us.us.preheader ]
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv96, i64 %indvars.iv89
  store double 0.000000e+00, double* %151, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %152 = load double, double* %149, align 8
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv89
  %154 = load double, double* %153, align 8
  %155 = fmul double %152, %154
  %156 = fadd double %155, 0.000000e+00
  store double %156, double* %151, align 8
  %157 = bitcast double %156 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %158 = phi i64 [ %157, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %159 = phi double [ %156, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %146, label %._crit_edge14.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge14.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %160 = bitcast double %176 to i64
  br label %._crit_edge14.us.us

._crit_edge14.us.us:                              ; preds = %._crit_edge14.us.us.loopexit, %.prol.loopexit
  %161 = phi i64 [ %160, %._crit_edge14.us.us.loopexit ], [ %158, %.prol.loopexit ]
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv89, i64 %indvars.iv96
  %163 = bitcast double* %162 to i64*
  store i64 %161, i64* %163, align 8
  %indvars.iv.next90 = add nsw i64 %indvars.iv89, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next90 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond, label %._crit_edge19.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %164 = phi double [ %176, %.lr.ph.us.us.new ], [ %159, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv96
  %166 = load double, double* %165, align 8
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv89
  %168 = load double, double* %167, align 8
  %169 = fmul double %166, %168
  %170 = fadd double %169, %164
  store double %170, double* %151, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv96
  %172 = load double, double* %171, align 8
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv89
  %174 = load double, double* %173, align 8
  %175 = fmul double %172, %174
  %176 = fadd double %175, %170
  store double %176, double* %151, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge14.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph23.split:                                   ; preds = %.lr.ph23.split.preheader, %._crit_edge19
  %indvars.iv115 = phi i64 [ 0, %.lr.ph23.split.preheader ], [ %indvars.iv.next116, %._crit_edge19 ]
  %indvar = phi i64 [ 0, %.lr.ph23.split.preheader ], [ %indvar.next, %._crit_edge19 ]
  %indvars.iv100 = phi i64 [ 1, %.lr.ph23.split.preheader ], [ %indvars.iv.next101, %._crit_edge19 ]
  %177 = sub i64 %141, %indvar
  %178 = trunc i64 %177 to i32
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv115, i64 %indvars.iv115
  store double 1.000000e+00, double* %179, align 8
  %indvars.iv.next116 = add nsw i64 %indvars.iv115, 1
  %180 = icmp slt i64 %indvars.iv.next116, %143
  br i1 %180, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %.lr.ph23.split
  %181 = sub i64 %140, %indvar
  %xtraiter113148 = and i64 %181, 1
  %lcmp.mod114 = icmp eq i64 %xtraiter113148, 0
  br i1 %lcmp.mod114, label %.prol.loopexit112, label %.prol.preheader111

.prol.preheader111:                               ; preds = %.lr.ph18
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv115, i64 %indvars.iv100
  store double 0.000000e+00, double* %182, align 8
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %indvars.iv115
  %184 = bitcast double* %183 to i64*
  store i64 0, i64* %184, align 8
  %indvars.iv.next103.prol = add nsw i64 %indvars.iv100, 1
  br label %.prol.loopexit112

.prol.loopexit112:                                ; preds = %.prol.preheader111, %.lr.ph18
  %indvars.iv102.unr.ph = phi i64 [ %indvars.iv.next103.prol, %.prol.preheader111 ], [ %indvars.iv100, %.lr.ph18 ]
  %185 = icmp eq i32 %178, 0
  br i1 %185, label %._crit_edge19, label %.lr.ph18.new.preheader

.lr.ph18.new.preheader:                           ; preds = %.prol.loopexit112
  br label %.lr.ph18.new

.lr.ph18.new:                                     ; preds = %.lr.ph18.new.preheader, %.lr.ph18.new
  %indvars.iv102 = phi i64 [ %indvars.iv.next103.1, %.lr.ph18.new ], [ %indvars.iv102.unr.ph, %.lr.ph18.new.preheader ]
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv115, i64 %indvars.iv102
  store double 0.000000e+00, double* %186, align 8
  %187 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv102, i64 %indvars.iv115
  %188 = bitcast double* %187 to i64*
  store i64 0, i64* %188, align 8
  %indvars.iv.next103 = add nsw i64 %indvars.iv102, 1
  %189 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv115, i64 %indvars.iv.next103
  store double 0.000000e+00, double* %189, align 8
  %190 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next103, i64 %indvars.iv115
  %191 = bitcast double* %190 to i64*
  store i64 0, i64* %191, align 8
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  %lftr.wideiv108.1 = trunc i64 %indvars.iv.next103.1 to i32
  %exitcond109.1 = icmp eq i32 %lftr.wideiv108.1, %0
  br i1 %exitcond109.1, label %._crit_edge19.loopexit, label %.lr.ph18.new

._crit_edge19.loopexit:                           ; preds = %.lr.ph18.new
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %.prol.loopexit112, %.lr.ph23.split
  %192 = icmp slt i64 %indvars.iv.next116, %142
  %indvars.iv.next101 = add nsw i64 %indvars.iv100, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %192, label %.lr.ph23.split, label %._crit_edge12._crit_edge.loopexit166

._crit_edge12._crit_edge.loopexit:                ; preds = %._crit_edge19.us-lcssa.us.us
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge.loopexit166:             ; preds = %._crit_edge19
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12._crit_edge.loopexit166, %._crit_edge12._crit_edge.loopexit, %._crit_edge12.._crit_edge12._crit_edge_crit_edge
  %.pre-phi = phi i64 [ %.pre, %._crit_edge12.._crit_edge12._crit_edge_crit_edge ], [ %145, %._crit_edge12._crit_edge.loopexit ], [ %142, %._crit_edge12._crit_edge.loopexit166 ]
  %193 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %.pre-phi, i64 %.pre-phi
  store double 1.000000e+00, double* %193, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge5

._crit_edge.us.preheader:                         ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge3.us
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge3.us, label %10

._crit_edge3.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %21 = icmp slt i64 %indvars.iv.next12, %8
  br i1 %21, label %._crit_edge.us, label %._crit_edge5.loopexit

._crit_edge5.loopexit:                            ; preds = %._crit_edge3.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

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
