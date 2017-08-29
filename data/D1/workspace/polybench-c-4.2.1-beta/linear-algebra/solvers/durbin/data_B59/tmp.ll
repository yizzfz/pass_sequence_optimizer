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
  tail call fastcc void @init_array(double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_durbin(double* %5, double* %6)
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
  tail call fastcc void @print_array(double* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture) unnamed_addr #2 {
.lr.ph:
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.4, %._crit_edge2 ]
  %1 = trunc i64 %indvars.iv to i32
  %2 = sub nuw nsw i32 2001, %1
  %3 = sitofp i32 %2 to double
  %4 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  store double %3, double* %4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = trunc i64 %indvars.iv.next to i32
  %6 = sub nuw nsw i32 2001, %5
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next
  store double %7, double* %8, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %9 = trunc i64 %indvars.iv.next.1 to i32
  %10 = sub nuw nsw i32 2001, %9
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.1
  store double %11, double* %12, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %13 = trunc i64 %indvars.iv.next.2 to i32
  %14 = sub nuw nsw i32 2001, %13
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.2
  store double %15, double* %16, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %17 = trunc i64 %indvars.iv.next.3 to i32
  %18 = sub nuw nsw i32 2001, %17
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.3
  store double %19, double* %20, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge, label %._crit_edge2

._crit_edge:                                      ; preds = %._crit_edge2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(double* nocapture readonly, double* nocapture) unnamed_addr #2 {
.lr.ph21.preheader:
  %2 = alloca [2000 x double], align 16
  %3 = load double, double* %0, align 8
  %4 = fsub double -0.000000e+00, %3
  store double %4, double* %1, align 8
  %5 = load double, double* %0, align 8
  %6 = fsub double -0.000000e+00, %5
  %7 = bitcast double* %1 to i8*
  %8 = bitcast [2000 x double]* %2 to i8*
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge17, %.lr.ph21.preheader
  %indvars.iv44 = phi i64 [ 1, %.lr.ph21.preheader ], [ %indvars.iv.next45, %._crit_edge17 ]
  %indvar = phi i64 [ 0, %.lr.ph21.preheader ], [ %12, %._crit_edge17 ]
  %9 = phi double [ %6, %.lr.ph21.preheader ], [ %60, %._crit_edge17 ]
  %10 = phi double [ 1.000000e+00, %.lr.ph21.preheader ], [ %55, %._crit_edge17 ]
  %11 = add i64 %indvar, 1
  %12 = add nuw nsw i64 %indvar, 1
  %13 = add nsw i64 %indvars.iv44, -1
  %xtraiter = and i64 %11, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge49.prol.loopexit, label %._crit_edge49.prol.preheader

._crit_edge49.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge49.prol

._crit_edge49.prol:                               ; preds = %._crit_edge49.prol, %._crit_edge49.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge49.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge49.prol ]
  %14 = phi double [ 0.000000e+00, %._crit_edge49.prol.preheader ], [ %21, %._crit_edge49.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge49.prol.preheader ], [ %prol.iter.sub, %._crit_edge49.prol ]
  %15 = sub nsw i64 %13, %indvars.iv.prol
  %16 = getelementptr inbounds double, double* %0, i64 %15
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %14, %20
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge49.prol.loopexit.unr-lcssa, label %._crit_edge49.prol, !llvm.loop !1

._crit_edge49.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge49.prol
  br label %._crit_edge49.prol.loopexit

._crit_edge49.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge49.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %21, %._crit_edge49.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge49.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %21, %._crit_edge49.prol.loopexit.unr-lcssa ]
  %22 = icmp ult i64 %indvar, 3
  br i1 %22, label %.lr.ph14, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge49.prol.loopexit
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge49 ]
  %23 = phi double [ %.unr, %.lr.ph.new ], [ %51, %._crit_edge49 ]
  %24 = sub nsw i64 %13, %indvars.iv
  %25 = getelementptr inbounds double, double* %0, i64 %24
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %23, %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = sub nsw i64 %13, %indvars.iv.next
  %32 = getelementptr inbounds double, double* %0, i64 %31
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %30, %36
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %38 = sub nsw i64 %13, %indvars.iv.next.1
  %39 = getelementptr inbounds double, double* %0, i64 %38
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %37, %43
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %45 = sub nsw i64 %13, %indvars.iv.next.2
  %46 = getelementptr inbounds double, double* %0, i64 %45
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %44, %50
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv44
  br i1 %exitcond.3, label %.lr.ph14.unr-lcssa, label %._crit_edge49

.lr.ph14.unr-lcssa:                               ; preds = %._crit_edge49
  br label %.lr.ph14

.lr.ph14:                                         ; preds = %._crit_edge49.prol.loopexit, %.lr.ph14.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge49.prol.loopexit ], [ %51, %.lr.ph14.unr-lcssa ]
  %52 = fmul double %9, %9
  %53 = shl i64 %indvar, 3
  %54 = fsub double 1.000000e+00, %52
  %55 = fmul double %10, %54
  %56 = getelementptr inbounds double, double* %0, i64 %indvars.iv44
  %57 = load double, double* %56, align 8
  %58 = fadd double %.lcssa, %57
  %59 = fsub double -0.000000e+00, %58
  %60 = fdiv double %59, %55
  %min.iters.check = icmp ult i64 %12, 4
  br i1 %min.iters.check, label %._crit_edge50.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph14
  %n.vec = and i64 %12, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %._crit_edge50.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert56 = insertelement <2 x double> undef, double %60, i32 0
  %broadcast.splat57 = shufflevector <2 x double> %broadcast.splatinsert56, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %61 = getelementptr inbounds double, double* %1, i64 %index
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %62, align 8
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %64, align 8
  %65 = sub nsw i64 %13, %index
  %66 = getelementptr inbounds double, double* %1, i64 %65
  %67 = getelementptr double, double* %66, i64 -1
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %68, align 8
  %reverse = shufflevector <2 x double> %wide.load53, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %69 = getelementptr double, double* %66, i64 -2
  %70 = getelementptr double, double* %69, i64 -1
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %71, align 8
  %reverse55 = shufflevector <2 x double> %wide.load54, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %72 = fmul <2 x double> %broadcast.splat57, %reverse
  %73 = fmul <2 x double> %broadcast.splat57, %reverse55
  %74 = fadd <2 x double> %wide.load, %72
  %75 = fadd <2 x double> %wide.load52, %73
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 0, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  store <2 x double> %74, <2 x double>* %77, align 16
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  store <2 x double> %75, <2 x double>* %79, align 16
  %index.next = add i64 %index, 4
  %80 = icmp eq i64 %index.next, %n.vec
  br i1 %80, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %12, %n.vec
  br i1 %cmp.n, label %._crit_edge17, label %._crit_edge50.preheader

._crit_edge50.preheader:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph14
  %indvars.iv32.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph14 ], [ %n.vec, %middle.block ]
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50.preheader, %._crit_edge50
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge50 ], [ %indvars.iv32.ph, %._crit_edge50.preheader ]
  %81 = getelementptr inbounds double, double* %1, i64 %indvars.iv32
  %82 = load double, double* %81, align 8
  %83 = sub nsw i64 %13, %indvars.iv32
  %84 = getelementptr inbounds double, double* %1, i64 %83
  %85 = load double, double* %84, align 8
  %86 = fmul double %60, %85
  %87 = fadd double %82, %86
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 0, i64 %indvars.iv32
  store double %87, double* %88, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next33, %indvars.iv44
  br i1 %exitcond37, label %._crit_edge17.loopexit, label %._crit_edge50, !llvm.loop !6

._crit_edge17.loopexit:                           ; preds = %._crit_edge50
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %middle.block
  %89 = add nuw nsw i64 %53, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %7, i8* nonnull %8, i64 %89, i32 8, i1 false)
  %90 = getelementptr inbounds double, double* %1, i64 %indvars.iv44
  store double %60, double* %90, align 8
  %exitcond47 = icmp eq i64 %12, 1999
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  br i1 %exitcond47, label %._crit_edge22, label %.lr.ph

._crit_edge22:                                    ; preds = %._crit_edge17
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %.lr.ph._crit_edge

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #6
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
