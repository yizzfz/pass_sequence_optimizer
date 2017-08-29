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
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %6

; <label>:6:                                      ; preds = %6, %.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %.prol.preheader ], [ %indvars.iv.next.prol, %6 ]
  %prol.iter = phi i64 [ %xtraiter, %.prol.preheader ], [ %prol.iter.sub, %6 ]
  %7 = trunc i64 %indvars.iv.prol to i32
  %8 = sub i32 %4, %7
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  store double %9, double* %10, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %6, !llvm.loop !1

.prol.loopexit.unr-lcssa:                         ; preds = %6
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.unr-lcssa ]
  %11 = icmp ult i64 %5, 3
  br i1 %11, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %12

; <label>:12:                                     ; preds = %12, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %12 ]
  %13 = trunc i64 %indvars.iv to i32
  %14 = sub i32 %4, %13
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %15, double* %16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = trunc i64 %indvars.iv.next to i32
  %18 = sub i32 %4, %17
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %19, double* %20, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %21 = trunc i64 %indvars.iv.next.1 to i32
  %22 = sub i32 %4, %21
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %23, double* %24, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %25 = trunc i64 %indvars.iv.next.2 to i32
  %26 = sub i32 %4, %25
  %27 = sitofp i32 %26 to double
  %28 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %27, double* %28, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %12

._crit_edge.loopexit.unr-lcssa:                   ; preds = %12
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double* nocapture readonly, double* nocapture) unnamed_addr #2 {
  %4 = alloca [2000 x double], align 16
  %5 = load double, double* %1, align 8
  %6 = fsub double -0.000000e+00, %5
  store double %6, double* %2, align 8
  %7 = icmp sgt i32 %0, 1
  br i1 %7, label %.lr.ph56.preheader, label %._crit_edge57

.lr.ph56.preheader:                               ; preds = %3
  %8 = load double, double* %1, align 8
  %9 = fsub double -0.000000e+00, %8
  %10 = add i32 %0, -1
  %11 = bitcast [2000 x double]* %4 to i8*
  %12 = bitcast double* %2 to i8*
  %wide.trip.count74 = zext i32 %10 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge51, %.lr.ph56.preheader
  %indvars.iv72 = phi i64 [ 1, %.lr.ph56.preheader ], [ %indvars.iv.next73, %._crit_edge51 ]
  %indvar = phi i64 [ 0, %.lr.ph56.preheader ], [ %56, %._crit_edge51 ]
  %.04253 = phi double [ 1.000000e+00, %.lr.ph56.preheader ], [ %58, %._crit_edge51 ]
  %.04352 = phi double [ %9, %.lr.ph56.preheader ], [ %63, %._crit_edge51 ]
  %13 = add i64 %indvar, 1
  %14 = shl i64 %indvar, 3
  %15 = fmul double %.04352, %.04352
  %16 = fsub double 1.000000e+00, %15
  %17 = add nsw i64 %indvars.iv72, -1
  %xtraiter = and i64 %13, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %18

; <label>:18:                                     ; preds = %18, %.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %.prol.preheader ], [ %indvars.iv.next.prol, %18 ]
  %.04144.prol = phi double [ 0.000000e+00, %.prol.preheader ], [ %25, %18 ]
  %prol.iter = phi i64 [ %xtraiter, %.prol.preheader ], [ %prol.iter.sub, %18 ]
  %19 = sub nsw i64 %17, %indvars.iv.prol
  %20 = getelementptr inbounds double, double* %1, i64 %19
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %.04144.prol, %24
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %18, !llvm.loop !3

.prol.loopexit.unr-lcssa:                         ; preds = %18
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %25, %.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.unr-lcssa ]
  %.04144.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %25, %.prol.loopexit.unr-lcssa ]
  %26 = icmp ult i64 %indvar, 3
  br i1 %26, label %.lr.ph48, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %27

; <label>:27:                                     ; preds = %27, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %27 ]
  %.04144 = phi double [ %.04144.unr, %.lr.ph.new ], [ %55, %27 ]
  %28 = sub nsw i64 %17, %indvars.iv
  %29 = getelementptr inbounds double, double* %1, i64 %28
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %.04144, %33
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %35 = sub nsw i64 %17, %indvars.iv.next
  %36 = getelementptr inbounds double, double* %1, i64 %35
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fadd double %34, %40
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %42 = sub nsw i64 %17, %indvars.iv.next.1
  %43 = getelementptr inbounds double, double* %1, i64 %42
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %41, %47
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %49 = sub nsw i64 %17, %indvars.iv.next.2
  %50 = getelementptr inbounds double, double* %1, i64 %49
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %48, %54
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv72
  br i1 %exitcond.3, label %.lr.ph48.unr-lcssa, label %27

.lr.ph48.unr-lcssa:                               ; preds = %27
  br label %.lr.ph48

.lr.ph48:                                         ; preds = %.prol.loopexit, %.lr.ph48.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %55, %.lr.ph48.unr-lcssa ]
  %56 = add nuw nsw i64 %indvar, 1
  %57 = add nuw nsw i64 %14, 8
  %58 = fmul double %.04253, %16
  %59 = getelementptr inbounds double, double* %1, i64 %indvars.iv72
  %60 = load double, double* %59, align 8
  %61 = fadd double %.lcssa, %60
  %62 = fsub double -0.000000e+00, %61
  %63 = fdiv double %62, %58
  %min.iters.check = icmp ult i64 %56, 4
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph48
  %n.vec = and i64 %56, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert83 = insertelement <2 x double> undef, double %63, i32 0
  %broadcast.splat84 = shufflevector <2 x double> %broadcast.splatinsert83, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %64 = getelementptr inbounds double, double* %2, i64 %index
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %65, align 8
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %67, align 8
  %68 = sub nsw i64 %17, %index
  %69 = getelementptr inbounds double, double* %2, i64 %68
  %70 = getelementptr double, double* %69, i64 -1
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %71, align 8
  %reverse = shufflevector <2 x double> %wide.load80, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %72 = getelementptr double, double* %69, i64 -2
  %73 = getelementptr double, double* %72, i64 -1
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %74, align 8
  %reverse82 = shufflevector <2 x double> %wide.load81, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %75 = fmul <2 x double> %broadcast.splat84, %reverse
  %76 = fmul <2 x double> %broadcast.splat84, %reverse82
  %77 = fadd <2 x double> %wide.load, %75
  %78 = fadd <2 x double> %wide.load79, %76
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %index
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> %77, <2 x double>* %80, align 16
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  store <2 x double> %78, <2 x double>* %82, align 16
  %index.next = add i64 %index, 4
  %83 = icmp eq i64 %index.next, %n.vec
  br i1 %83, label %middle.block, label %vector.body, !llvm.loop !4

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %56, %n.vec
  br i1 %cmp.n, label %._crit_edge51, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph48
  %indvars.iv60.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph48 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %scalar.ph ], [ %indvars.iv60.ph, %scalar.ph.preheader ]
  %84 = getelementptr inbounds double, double* %2, i64 %indvars.iv60
  %85 = load double, double* %84, align 8
  %86 = sub nsw i64 %17, %indvars.iv60
  %87 = getelementptr inbounds double, double* %2, i64 %86
  %88 = load double, double* %87, align 8
  %89 = fmul double %63, %88
  %90 = fadd double %85, %89
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %indvars.iv60
  store double %90, double* %91, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next61, %indvars.iv72
  br i1 %exitcond65, label %._crit_edge51.loopexit, label %scalar.ph, !llvm.loop !7

._crit_edge51.loopexit:                           ; preds = %scalar.ph
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %middle.block
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* nonnull %11, i64 %57, i32 8, i1 false)
  %92 = getelementptr inbounds double, double* %2, i64 %indvars.iv72
  store double %63, double* %92, align 8
  %exitcond75 = icmp eq i64 %56, %wide.trip.count74
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  br i1 %exitcond75, label %._crit_edge57.loopexit, label %.lr.ph

._crit_edge57.loopexit:                           ; preds = %._crit_edge51
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge57.loopexit, %3
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
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge7

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge7.loopexit, label %.lr.ph

._crit_edge7.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %2
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
