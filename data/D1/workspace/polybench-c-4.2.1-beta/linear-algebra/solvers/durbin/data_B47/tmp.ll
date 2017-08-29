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
  %5 = zext i32 %0 to i64
  %6 = add nsw i64 %5, -1
  %xtraiter = and i64 %5, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge2.prol.loopexit, label %._crit_edge2.prol.preheader

._crit_edge2.prol.preheader:                      ; preds = %.lr.ph
  br label %._crit_edge2.prol

._crit_edge2.prol:                                ; preds = %._crit_edge2.prol, %._crit_edge2.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge2.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge2.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge2.prol.preheader ], [ %prol.iter.sub, %._crit_edge2.prol ]
  %7 = trunc i64 %indvars.iv.prol to i32
  %8 = sub i32 %4, %7
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  store double %9, double* %10, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge2.prol.loopexit.unr-lcssa, label %._crit_edge2.prol, !llvm.loop !1

._crit_edge2.prol.loopexit.unr-lcssa:             ; preds = %._crit_edge2.prol
  br label %._crit_edge2.prol.loopexit

._crit_edge2.prol.loopexit:                       ; preds = %.lr.ph, %._crit_edge2.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge2.prol.loopexit.unr-lcssa ]
  %11 = icmp ult i64 %6, 3
  br i1 %11, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge2.prol.loopexit
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge2 ]
  %12 = trunc i64 %indvars.iv to i32
  %13 = sub i32 %4, %12
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %14, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = trunc i64 %indvars.iv.next to i32
  %17 = sub i32 %4, %16
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %20 = trunc i64 %indvars.iv.next.1 to i32
  %21 = sub i32 %4, %20
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %22, double* %23, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %24 = trunc i64 %indvars.iv.next.2 to i32
  %25 = sub i32 %4, %24
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %26, double* %27, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond3.3 = icmp eq i64 %indvars.iv.next.3, %5
  br i1 %exitcond3.3, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge2

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
  %indvar = phi i64 [ 0, %.lr.ph17.preheader ], [ %14, %._crit_edge12 ]
  %.0314 = phi double [ %11, %.lr.ph17.preheader ], [ %60, %._crit_edge12 ]
  %.0413 = phi double [ 1.000000e+00, %.lr.ph17.preheader ], [ %55, %._crit_edge12 ]
  %13 = add i64 %indvar, 1
  %14 = add nuw nsw i64 %indvar, 1
  %15 = fmul double %.0314, %.0314
  %16 = add nsw i64 %indvars.iv33, -1
  %xtraiter = and i64 %13, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge37.prol.loopexit, label %._crit_edge37.prol.preheader

._crit_edge37.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge37.prol

._crit_edge37.prol:                               ; preds = %._crit_edge37.prol, %._crit_edge37.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge37.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge37.prol ]
  %.025.prol = phi double [ 0.000000e+00, %._crit_edge37.prol.preheader ], [ %23, %._crit_edge37.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge37.prol.preheader ], [ %prol.iter.sub, %._crit_edge37.prol ]
  %17 = sub nsw i64 %16, %indvars.iv.prol
  %18 = getelementptr inbounds double, double* %1, i64 %17
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %.025.prol, %22
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge37.prol.loopexit.unr-lcssa, label %._crit_edge37.prol, !llvm.loop !3

._crit_edge37.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge37.prol
  br label %._crit_edge37.prol.loopexit

._crit_edge37.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge37.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %23, %._crit_edge37.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge37.prol.loopexit.unr-lcssa ]
  %.025.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %23, %._crit_edge37.prol.loopexit.unr-lcssa ]
  %24 = icmp ult i64 %indvar, 3
  br i1 %24, label %.lr.ph9, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge37.prol.loopexit
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge37 ]
  %.025 = phi double [ %.025.unr, %.lr.ph.new ], [ %52, %._crit_edge37 ]
  %25 = sub nsw i64 %16, %indvars.iv
  %26 = getelementptr inbounds double, double* %1, i64 %25
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %.025, %30
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %32 = sub nsw i64 %16, %indvars.iv.next
  %33 = getelementptr inbounds double, double* %1, i64 %32
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %31, %37
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %39 = sub nsw i64 %16, %indvars.iv.next.1
  %40 = getelementptr inbounds double, double* %1, i64 %39
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %38, %44
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %46 = sub nsw i64 %16, %indvars.iv.next.2
  %47 = getelementptr inbounds double, double* %1, i64 %46
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %45, %51
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv33
  br i1 %exitcond.3, label %.lr.ph9.unr-lcssa, label %._crit_edge37

.lr.ph9.unr-lcssa:                                ; preds = %._crit_edge37
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %._crit_edge37.prol.loopexit, %.lr.ph9.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge37.prol.loopexit ], [ %52, %.lr.ph9.unr-lcssa ]
  %53 = shl i64 %indvar, 3
  %54 = fsub double 1.000000e+00, %15
  %55 = fmul double %.0413, %54
  %56 = getelementptr inbounds double, double* %1, i64 %indvars.iv33
  %57 = load double, double* %56, align 8
  %58 = fadd double %.lcssa, %57
  %59 = fsub double -0.000000e+00, %58
  %60 = fdiv double %59, %55
  %min.iters.check = icmp ult i64 %14, 4
  br i1 %min.iters.check, label %._crit_edge38.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph9
  %n.vec = and i64 %14, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %._crit_edge38.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert44 = insertelement <2 x double> undef, double %60, i32 0
  %broadcast.splat45 = shufflevector <2 x double> %broadcast.splatinsert44, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %61 = getelementptr inbounds double, double* %2, i64 %index
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %62, align 8
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %64, align 8
  %65 = sub nsw i64 %16, %index
  %66 = getelementptr inbounds double, double* %2, i64 %65
  %67 = getelementptr double, double* %66, i64 -1
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %68, align 8
  %reverse = shufflevector <2 x double> %wide.load41, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %69 = getelementptr double, double* %66, i64 -2
  %70 = getelementptr double, double* %69, i64 -1
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %71, align 8
  %reverse43 = shufflevector <2 x double> %wide.load42, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %72 = fmul <2 x double> %broadcast.splat45, %reverse
  %73 = fmul <2 x double> %broadcast.splat45, %reverse43
  %74 = fadd <2 x double> %wide.load, %72
  %75 = fadd <2 x double> %wide.load40, %73
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  store <2 x double> %74, <2 x double>* %77, align 16
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  store <2 x double> %75, <2 x double>* %79, align 16
  %index.next = add i64 %index, 4
  %80 = icmp eq i64 %index.next, %n.vec
  br i1 %80, label %middle.block, label %vector.body, !llvm.loop !4

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %14, %n.vec
  br i1 %cmp.n, label %._crit_edge12, label %._crit_edge38.preheader

._crit_edge38.preheader:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph9
  %indvars.iv21.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph9 ], [ %n.vec, %middle.block ]
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.preheader, %._crit_edge38
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge38 ], [ %indvars.iv21.ph, %._crit_edge38.preheader ]
  %81 = getelementptr inbounds double, double* %2, i64 %indvars.iv21
  %82 = load double, double* %81, align 8
  %83 = sub nsw i64 %16, %indvars.iv21
  %84 = getelementptr inbounds double, double* %2, i64 %83
  %85 = load double, double* %84, align 8
  %86 = fmul double %60, %85
  %87 = fadd double %82, %86
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv21
  store double %87, double* %88, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next22, %indvars.iv33
  br i1 %exitcond26, label %._crit_edge12.loopexit, label %._crit_edge38, !llvm.loop !7

._crit_edge12.loopexit:                           ; preds = %._crit_edge38
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %middle.block
  %89 = add nuw nsw i64 %53, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %4, i8* nonnull %6, i64 %89, i32 8, i1 false)
  %90 = getelementptr inbounds double, double* %2, i64 %indvars.iv33
  store double %60, double* %90, align 8
  %exitcond36 = icmp eq i64 %14, %wide.trip.count35
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
  %8 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph._crit_edge ], [ 0, %.lr.ph.preheader ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.lr.ph._crit_edge

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next, %8
  br i1 %exitcond2, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
