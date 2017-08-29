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

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(double* nocapture readonly, double* nocapture) unnamed_addr #2 {
  %3 = bitcast double* %1 to i8*
  %4 = alloca [2000 x double], align 16
  %5 = bitcast [2000 x double]* %4 to i8*
  %6 = load double, double* %0, align 8
  %7 = fsub double -0.000000e+00, %6
  store double %7, double* %1, align 8
  %8 = load double, double* %0, align 8
  %9 = fsub double -0.000000e+00, %8
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge8, %2
  %indvars.iv26 = phi i64 [ 1, %2 ], [ %indvars.iv.next27, %._crit_edge8 ]
  %indvar = phi i64 [ 0, %2 ], [ %11, %._crit_edge8 ]
  %.0310 = phi double [ %9, %2 ], [ %57, %._crit_edge8 ]
  %.049 = phi double [ 1.000000e+00, %2 ], [ %52, %._crit_edge8 ]
  %10 = add i64 %indvar, 1
  %11 = add nuw nsw i64 %indvar, 1
  %12 = fmul double %.0310, %.0310
  %13 = add nsw i64 %indvars.iv26, -1
  %xtraiter = and i64 %10, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge29.prol.loopexit, label %._crit_edge29.prol.preheader

._crit_edge29.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge29.prol

._crit_edge29.prol:                               ; preds = %._crit_edge29.prol, %._crit_edge29.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge29.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge29.prol ]
  %.021.prol = phi double [ 0.000000e+00, %._crit_edge29.prol.preheader ], [ %20, %._crit_edge29.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge29.prol.preheader ], [ %prol.iter.sub, %._crit_edge29.prol ]
  %14 = sub nsw i64 %13, %indvars.iv.prol
  %15 = getelementptr inbounds double, double* %0, i64 %14
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %.021.prol, %19
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge29.prol.loopexit.unr-lcssa, label %._crit_edge29.prol, !llvm.loop !1

._crit_edge29.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge29.prol
  br label %._crit_edge29.prol.loopexit

._crit_edge29.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge29.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %20, %._crit_edge29.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge29.prol.loopexit.unr-lcssa ]
  %.021.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %20, %._crit_edge29.prol.loopexit.unr-lcssa ]
  %21 = icmp ult i64 %indvar, 3
  br i1 %21, label %.lr.ph5, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge29.prol.loopexit
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge29 ]
  %.021 = phi double [ %.021.unr, %.lr.ph.new ], [ %49, %._crit_edge29 ]
  %22 = sub nsw i64 %13, %indvars.iv
  %23 = getelementptr inbounds double, double* %0, i64 %22
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %.021, %27
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = sub nsw i64 %13, %indvars.iv.next
  %30 = getelementptr inbounds double, double* %0, i64 %29
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %28, %34
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %36 = sub nsw i64 %13, %indvars.iv.next.1
  %37 = getelementptr inbounds double, double* %0, i64 %36
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %35, %41
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %43 = sub nsw i64 %13, %indvars.iv.next.2
  %44 = getelementptr inbounds double, double* %0, i64 %43
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fadd double %42, %48
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv26
  br i1 %exitcond.3, label %.lr.ph5.unr-lcssa, label %._crit_edge29

.lr.ph5.unr-lcssa:                                ; preds = %._crit_edge29
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %._crit_edge29.prol.loopexit, %.lr.ph5.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge29.prol.loopexit ], [ %49, %.lr.ph5.unr-lcssa ]
  %50 = shl i64 %indvar, 3
  %51 = fsub double 1.000000e+00, %12
  %52 = fmul double %.049, %51
  %53 = getelementptr inbounds double, double* %0, i64 %indvars.iv26
  %54 = load double, double* %53, align 8
  %55 = fadd double %.lcssa, %54
  %56 = fsub double -0.000000e+00, %55
  %57 = fdiv double %56, %52
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %._crit_edge30.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph5
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %._crit_edge30.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert36 = insertelement <2 x double> undef, double %57, i32 0
  %broadcast.splat37 = shufflevector <2 x double> %broadcast.splatinsert36, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %58 = getelementptr inbounds double, double* %1, i64 %index
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load32 = load <2 x double>, <2 x double>* %61, align 8
  %62 = sub nsw i64 %13, %index
  %63 = getelementptr inbounds double, double* %1, i64 %62
  %64 = getelementptr double, double* %63, i64 -1
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %65, align 8
  %reverse = shufflevector <2 x double> %wide.load33, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %66 = getelementptr double, double* %63, i64 -2
  %67 = getelementptr double, double* %66, i64 -1
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %68, align 8
  %reverse35 = shufflevector <2 x double> %wide.load34, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %69 = fmul <2 x double> %broadcast.splat37, %reverse
  %70 = fmul <2 x double> %broadcast.splat37, %reverse35
  %71 = fadd <2 x double> %wide.load, %69
  %72 = fadd <2 x double> %wide.load32, %70
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %index
  %74 = bitcast double* %73 to <2 x double>*
  store <2 x double> %71, <2 x double>* %74, align 16
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  store <2 x double> %72, <2 x double>* %76, align 16
  %index.next = add i64 %index, 4
  %77 = icmp eq i64 %index.next, %n.vec
  br i1 %77, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %._crit_edge8, label %._crit_edge30.preheader

._crit_edge30.preheader:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph5
  %indvars.iv14.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph5 ], [ %n.vec, %middle.block ]
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.preheader, %._crit_edge30
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge30 ], [ %indvars.iv14.ph, %._crit_edge30.preheader ]
  %78 = getelementptr inbounds double, double* %1, i64 %indvars.iv14
  %79 = load double, double* %78, align 8
  %80 = sub nsw i64 %13, %indvars.iv14
  %81 = getelementptr inbounds double, double* %1, i64 %80
  %82 = load double, double* %81, align 8
  %83 = fmul double %57, %82
  %84 = fadd double %79, %83
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %indvars.iv14
  store double %84, double* %85, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next15, %indvars.iv26
  br i1 %exitcond19, label %._crit_edge8.loopexit, label %._crit_edge30, !llvm.loop !6

._crit_edge8.loopexit:                            ; preds = %._crit_edge30
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %middle.block
  %86 = add nuw nsw i64 %50, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %3, i8* nonnull %5, i64 %86, i32 8, i1 false)
  %87 = getelementptr inbounds double, double* %1, i64 %indvars.iv26
  store double %57, double* %87, align 8
  %exitcond28 = icmp eq i64 %11, 1999
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
