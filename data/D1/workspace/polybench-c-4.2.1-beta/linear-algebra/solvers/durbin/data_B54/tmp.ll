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
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next.4, %._crit_edge ]
  %2 = sub nuw nsw i64 2001, %indvars.iv
  %3 = trunc i64 %2 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  store double %4, double* %5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = sub i64 2000, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next
  store double %8, double* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %10 = sub i64 1999, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.1
  store double %12, double* %13, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %14 = sub i64 1998, %indvars.iv
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.2
  store double %16, double* %17, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %18 = sub i64 1997, %indvars.iv
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.3
  store double %20, double* %21, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %22, label %._crit_edge

; <label>:22:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_durbin(double* nocapture readonly, double* nocapture) unnamed_addr #0 {
  %3 = alloca [2000 x double], align 16
  %4 = load double, double* %0, align 8
  %5 = fsub double -0.000000e+00, %4
  store double %5, double* %1, align 8
  %6 = load double, double* %0, align 8
  %7 = fsub double -0.000000e+00, %6
  %8 = bitcast double* %1 to i8*
  %9 = bitcast [2000 x double]* %3 to i8*
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge8, %2
  %indvars.iv26 = phi i64 [ 1, %2 ], [ %indvars.iv.next27, %._crit_edge8 ]
  %indvar = phi i64 [ 0, %2 ], [ %51, %._crit_edge8 ]
  %.0310 = phi double [ %7, %2 ], [ %58, %._crit_edge8 ]
  %.049 = phi double [ 1.000000e+00, %2 ], [ %53, %._crit_edge8 ]
  %10 = add i64 %indvar, 1
  %11 = fmul double %.0310, %.0310
  %12 = add nsw i64 %indvars.iv26, -1
  %xtraiter = and i64 %10, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge29.prol.loopexit, label %._crit_edge29.prol.preheader

._crit_edge29.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge29.prol

._crit_edge29.prol:                               ; preds = %._crit_edge29.prol, %._crit_edge29.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge29.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge29.prol ]
  %.021.prol = phi double [ 0.000000e+00, %._crit_edge29.prol.preheader ], [ %19, %._crit_edge29.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge29.prol.preheader ], [ %prol.iter.sub, %._crit_edge29.prol ]
  %13 = sub nsw i64 %12, %indvars.iv.prol
  %14 = getelementptr inbounds double, double* %0, i64 %13
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %.021.prol, %18
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge29.prol.loopexit.unr-lcssa, label %._crit_edge29.prol, !llvm.loop !1

._crit_edge29.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge29.prol
  br label %._crit_edge29.prol.loopexit

._crit_edge29.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge29.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %19, %._crit_edge29.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge29.prol.loopexit.unr-lcssa ]
  %.021.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %19, %._crit_edge29.prol.loopexit.unr-lcssa ]
  %20 = icmp ult i64 %indvar, 3
  br i1 %20, label %.lr.ph5, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge29.prol.loopexit
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge29 ]
  %.021 = phi double [ %.021.unr, %.lr.ph.new ], [ %48, %._crit_edge29 ]
  %21 = sub nsw i64 %12, %indvars.iv
  %22 = getelementptr inbounds double, double* %0, i64 %21
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %.021, %26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = sub nsw i64 %12, %indvars.iv.next
  %29 = getelementptr inbounds double, double* %0, i64 %28
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %27, %33
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %35 = sub nsw i64 %12, %indvars.iv.next.1
  %36 = getelementptr inbounds double, double* %0, i64 %35
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fadd double %34, %40
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %42 = sub nsw i64 %12, %indvars.iv.next.2
  %43 = getelementptr inbounds double, double* %0, i64 %42
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %41, %47
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv26
  br i1 %exitcond.3, label %.lr.ph5.unr-lcssa, label %._crit_edge29

.lr.ph5.unr-lcssa:                                ; preds = %._crit_edge29
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %._crit_edge29.prol.loopexit, %.lr.ph5.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge29.prol.loopexit ], [ %48, %.lr.ph5.unr-lcssa ]
  %49 = shl i64 %indvar, 3
  %50 = fsub double 1.000000e+00, %11
  %51 = add nuw nsw i64 %indvar, 1
  %52 = add nuw nsw i64 %49, 8
  %53 = fmul double %.049, %50
  %54 = getelementptr inbounds double, double* %0, i64 %indvars.iv26
  %55 = load double, double* %54, align 8
  %56 = fadd double %.lcssa, %55
  %57 = fsub double -0.000000e+00, %56
  %58 = fdiv double %57, %53
  %min.iters.check = icmp ult i64 %51, 4
  br i1 %min.iters.check, label %._crit_edge30.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph5
  %n.vec = and i64 %51, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %._crit_edge30.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert36 = insertelement <2 x double> undef, double %58, i32 0
  %broadcast.splat37 = shufflevector <2 x double> %broadcast.splatinsert36, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %59 = getelementptr inbounds double, double* %1, i64 %index
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %60, align 8
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load32 = load <2 x double>, <2 x double>* %62, align 8
  %63 = sub nsw i64 %12, %index
  %64 = getelementptr inbounds double, double* %1, i64 %63
  %65 = getelementptr double, double* %64, i64 -1
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %66, align 8
  %reverse = shufflevector <2 x double> %wide.load33, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %67 = getelementptr double, double* %64, i64 -2
  %68 = getelementptr double, double* %67, i64 -1
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %69, align 8
  %reverse35 = shufflevector <2 x double> %wide.load34, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %70 = fmul <2 x double> %broadcast.splat37, %reverse
  %71 = fmul <2 x double> %broadcast.splat37, %reverse35
  %72 = fadd <2 x double> %wide.load, %70
  %73 = fadd <2 x double> %wide.load32, %71
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %index
  %75 = bitcast double* %74 to <2 x double>*
  store <2 x double> %72, <2 x double>* %75, align 16
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  store <2 x double> %73, <2 x double>* %77, align 16
  %index.next = add i64 %index, 4
  %78 = icmp eq i64 %index.next, %n.vec
  br i1 %78, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %51, %n.vec
  br i1 %cmp.n, label %._crit_edge8, label %._crit_edge30.preheader

._crit_edge30.preheader:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph5
  %indvars.iv14.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph5 ], [ %n.vec, %middle.block ]
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.preheader, %._crit_edge30
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge30 ], [ %indvars.iv14.ph, %._crit_edge30.preheader ]
  %79 = getelementptr inbounds double, double* %1, i64 %indvars.iv14
  %80 = load double, double* %79, align 8
  %81 = sub nsw i64 %12, %indvars.iv14
  %82 = getelementptr inbounds double, double* %1, i64 %81
  %83 = load double, double* %82, align 8
  %84 = fmul double %58, %83
  %85 = fadd double %80, %84
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv14
  store double %85, double* %86, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next15, %indvars.iv26
  br i1 %exitcond19, label %._crit_edge8.loopexit, label %._crit_edge30, !llvm.loop !6

._crit_edge8.loopexit:                            ; preds = %._crit_edge30
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %middle.block
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %8, i8* nonnull %9, i64 %52, i32 8, i1 false)
  %87 = getelementptr inbounds double, double* %1, i64 %indvars.iv26
  store double %58, double* %87, align 8
  %exitcond28 = icmp eq i64 %51, 1999
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  br i1 %exitcond28, label %88, label %.lr.ph

; <label>:88:                                     ; preds = %._crit_edge8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge2
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge2

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
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
