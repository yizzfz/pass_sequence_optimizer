; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  tail call fastcc void @init_array(i32 2000, double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_durbin(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 2000, double* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %4 = add nsw i32 %0, 1
  %wide.trip.count = zext i32 %0 to i64
  %5 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge2.prol.loopexit, label %._crit_edge2.prol.preheader

._crit_edge2.prol.preheader:                      ; preds = %.lr.ph
  br label %._crit_edge2.prol

._crit_edge2.prol:                                ; preds = %._crit_edge2.prol, %._crit_edge2.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge2.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge2.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge2.prol.preheader ], [ %prol.iter.sub, %._crit_edge2.prol ]
  %6 = trunc i64 %indvars.iv.prol to i32
  %7 = sub i32 %4, %6
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  store double %8, double* %9, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge2.prol.loopexit.unr-lcssa, label %._crit_edge2.prol, !llvm.loop !1

._crit_edge2.prol.loopexit.unr-lcssa:             ; preds = %._crit_edge2.prol
  br label %._crit_edge2.prol.loopexit

._crit_edge2.prol.loopexit:                       ; preds = %.lr.ph, %._crit_edge2.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge2.prol.loopexit.unr-lcssa ]
  %10 = icmp ult i64 %5, 3
  br i1 %10, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge2.prol.loopexit
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge2 ]
  %11 = trunc i64 %indvars.iv to i32
  %12 = sub i32 %4, %11
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = bitcast double* %14 to <2 x double>*
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = trunc i64 %indvars.iv.next to i32
  %17 = sub i32 %4, %16
  %18 = sitofp i32 %17 to double
  %19 = insertelement <2 x double> undef, double %13, i32 0
  %20 = insertelement <2 x double> %19, double %18, i32 1
  store <2 x double> %20, <2 x double>* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %21 = trunc i64 %indvars.iv.next.1 to i32
  %22 = sub i32 %4, %21
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  %25 = bitcast double* %24 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %26 = trunc i64 %indvars.iv.next.2 to i32
  %27 = sub i32 %4, %26
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  store <2 x double> %30, <2 x double>* %25, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge2

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge2
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge2.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double* nocapture readonly, double* nocapture) unnamed_addr #2 {
  %4 = bitcast double* %2 to i8*
  %5 = alloca [2000 x double], align 16
  %6 = bitcast [2000 x double]* %5 to i8*
  %7 = load double, double* %1, align 8
  %8 = fsub double -0.000000e+00, %7
  store double %8, double* %2, align 8
  %9 = icmp sgt i32 %0, 1
  br i1 %9, label %.lr.ph17.preheader, label %._crit_edge18

.lr.ph17.preheader:                               ; preds = %3
  %10 = load double, double* %1, align 8
  %11 = fsub double -0.000000e+00, %10
  %12 = add i32 %0, -1
  %wide.trip.count35 = zext i32 %12 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge12, %.lr.ph17.preheader
  %indvars.iv33 = phi i64 [ 1, %.lr.ph17.preheader ], [ %indvars.iv.next34, %._crit_edge12 ]
  %indvar = phi i64 [ 0, %.lr.ph17.preheader ], [ %52, %._crit_edge12 ]
  %.0314 = phi double [ %11, %.lr.ph17.preheader ], [ %59, %._crit_edge12 ]
  %.0413 = phi double [ 1.000000e+00, %.lr.ph17.preheader ], [ %54, %._crit_edge12 ]
  %13 = add i64 %indvar, 1
  %14 = shl i64 %indvar, 3
  %15 = fmul double %.0314, %.0314
  %16 = fsub double 1.000000e+00, %15
  %17 = add nsw i64 %indvars.iv33, -1
  %xtraiter = and i64 %13, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge37.prol.loopexit, label %._crit_edge37.prol.preheader

._crit_edge37.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge37.prol

._crit_edge37.prol:                               ; preds = %._crit_edge37.prol, %._crit_edge37.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge37.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge37.prol ]
  %.025.prol = phi double [ 0.000000e+00, %._crit_edge37.prol.preheader ], [ %24, %._crit_edge37.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge37.prol.preheader ], [ %prol.iter.sub, %._crit_edge37.prol ]
  %18 = sub nsw i64 %17, %indvars.iv.prol
  %19 = getelementptr inbounds double, double* %1, i64 %18
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %.025.prol, %23
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge37.prol.loopexit.unr-lcssa, label %._crit_edge37.prol, !llvm.loop !3

._crit_edge37.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge37.prol
  br label %._crit_edge37.prol.loopexit

._crit_edge37.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge37.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %24, %._crit_edge37.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge37.prol.loopexit.unr-lcssa ]
  %.025.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %24, %._crit_edge37.prol.loopexit.unr-lcssa ]
  %25 = icmp ult i64 %indvar, 3
  br i1 %25, label %.lr.ph9, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge37.prol.loopexit
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge37 ]
  %.025 = phi double [ %.025.unr, %.lr.ph.new ], [ %51, %._crit_edge37 ]
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %27 = bitcast double* %26 to <2 x double>*
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = sub nsw i64 %17, %indvars.iv.next
  %29 = getelementptr inbounds double, double* %1, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %31 = load <2 x double>, <2 x double>* %30, align 8
  %32 = load <2 x double>, <2 x double>* %27, align 8
  %33 = shufflevector <2 x double> %31, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %34 = fmul <2 x double> %33, %32
  %35 = extractelement <2 x double> %34, i32 0
  %36 = extractelement <2 x double> %34, i32 1
  %37 = fadd double %.025, %35
  %38 = fadd double %37, %36
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %39 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %40 = bitcast double* %39 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %41 = sub nsw i64 %17, %indvars.iv.next.2
  %42 = getelementptr inbounds double, double* %1, i64 %41
  %43 = bitcast double* %42 to <2 x double>*
  %44 = load <2 x double>, <2 x double>* %43, align 8
  %45 = load <2 x double>, <2 x double>* %40, align 8
  %46 = shufflevector <2 x double> %44, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %47 = fmul <2 x double> %46, %45
  %48 = extractelement <2 x double> %47, i32 0
  %49 = extractelement <2 x double> %47, i32 1
  %50 = fadd double %38, %48
  %51 = fadd double %50, %49
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv33
  br i1 %exitcond.3, label %.lr.ph9.unr-lcssa, label %._crit_edge37

.lr.ph9.unr-lcssa:                                ; preds = %._crit_edge37
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %._crit_edge37.prol.loopexit, %.lr.ph9.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge37.prol.loopexit ], [ %51, %.lr.ph9.unr-lcssa ]
  %52 = add nuw nsw i64 %indvar, 1
  %53 = add nuw nsw i64 %14, 8
  %54 = fmul double %.0413, %16
  %55 = getelementptr inbounds double, double* %1, i64 %indvars.iv33
  %56 = load double, double* %55, align 8
  %57 = fadd double %.lcssa, %56
  %58 = fsub double -0.000000e+00, %57
  %59 = fdiv double %58, %54
  %min.iters.check = icmp ult i64 %52, 4
  br i1 %min.iters.check, label %._crit_edge38.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph9
  %n.vec = and i64 %52, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %._crit_edge38.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert44 = insertelement <2 x double> undef, double %59, i32 0
  %broadcast.splat45 = shufflevector <2 x double> %broadcast.splatinsert44, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %60 = getelementptr inbounds double, double* %2, i64 %index
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %61, align 8
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %63, align 8
  %64 = sub nsw i64 %17, %index
  %65 = getelementptr inbounds double, double* %2, i64 %64
  %66 = getelementptr double, double* %65, i64 -1
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %67, align 8
  %reverse = shufflevector <2 x double> %wide.load41, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %68 = getelementptr double, double* %65, i64 -2
  %69 = getelementptr double, double* %68, i64 -1
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %70, align 8
  %reverse43 = shufflevector <2 x double> %wide.load42, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %71 = fmul <2 x double> %broadcast.splat45, %reverse
  %72 = fmul <2 x double> %broadcast.splat45, %reverse43
  %73 = fadd <2 x double> %wide.load, %71
  %74 = fadd <2 x double> %wide.load40, %72
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %index
  %76 = bitcast double* %75 to <2 x double>*
  store <2 x double> %73, <2 x double>* %76, align 16
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  store <2 x double> %74, <2 x double>* %78, align 16
  %index.next = add i64 %index, 4
  %79 = icmp eq i64 %index.next, %n.vec
  br i1 %79, label %middle.block, label %vector.body, !llvm.loop !4

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %52, %n.vec
  br i1 %cmp.n, label %._crit_edge12, label %._crit_edge38.preheader

._crit_edge38.preheader:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph9
  %indvars.iv21.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph9 ], [ %n.vec, %middle.block ]
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.preheader, %._crit_edge38
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge38 ], [ %indvars.iv21.ph, %._crit_edge38.preheader ]
  %80 = getelementptr inbounds double, double* %2, i64 %indvars.iv21
  %81 = load double, double* %80, align 8
  %82 = sub nsw i64 %17, %indvars.iv21
  %83 = getelementptr inbounds double, double* %2, i64 %82
  %84 = load double, double* %83, align 8
  %85 = fmul double %59, %84
  %86 = fadd double %81, %85
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv21
  store double %86, double* %87, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next22, %indvars.iv33
  br i1 %exitcond26, label %._crit_edge12.loopexit, label %._crit_edge38, !llvm.loop !7

._crit_edge12.loopexit:                           ; preds = %._crit_edge38
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %middle.block
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %4, i8* nonnull %6, i64 %53, i32 8, i1 false)
  %88 = getelementptr inbounds double, double* %2, i64 %indvars.iv33
  store double %59, double* %88, align 8
  %exitcond36 = icmp eq i64 %52, %wide.trip.count35
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  br i1 %exitcond36, label %._crit_edge18.loopexit, label %.lr.ph

._crit_edge18.loopexit:                           ; preds = %._crit_edge12
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %3
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph._crit_edge ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.lr.ph._crit_edge

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
