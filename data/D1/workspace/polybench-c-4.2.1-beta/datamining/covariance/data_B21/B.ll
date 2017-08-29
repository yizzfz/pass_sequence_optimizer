; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %17, %4
  %indvars.iv4 = phi i64 [ 0, %4 ], [ %indvars.iv.next5, %17 ]
  %5 = trunc i64 %indvars.iv4 to i32
  %6 = sitofp i32 %5 to double
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sitofp i32 %7 to double
  %9 = fmul double %6, %8
  %10 = fdiv double %9, 1.200000e+03
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv4, i64 %indvars.iv
  store double %10, double* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = trunc i64 %indvars.iv.next to i32
  %13 = sitofp i32 %12 to double
  %14 = fmul double %6, %13
  %15 = fdiv double %14, 1.200000e+03
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv4, i64 %indvars.iv.next
  store double %15, double* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond, label %18, label %._crit_edge.preheader

; <label>:18:                                     ; preds = %17
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  br label %7

; <label>:7:                                      ; preds = %23, %6
  %indvars.iv32 = phi i64 [ 0, %6 ], [ %indvars.iv.next33, %23 ]
  %8 = getelementptr inbounds double, double* %5, i64 %indvars.iv32
  store double 0.000000e+00, double* %8, align 8
  br label %9

; <label>:9:                                      ; preds = %9, %7
  %10 = phi double [ 0.000000e+00, %7 ], [ %22, %9 ]
  %indvars.iv29 = phi i64 [ 0, %7 ], [ %indvars.iv.next30.3, %9 ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv29, i64 %indvars.iv32
  %12 = load double, double* %11, align 8
  %13 = fadd double %12, %10
  store double %13, double* %8, align 8
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next30, i64 %indvars.iv32
  %15 = load double, double* %14, align 8
  %16 = fadd double %15, %13
  store double %16, double* %8, align 8
  %indvars.iv.next30.1 = or i64 %indvars.iv29, 2
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next30.1, i64 %indvars.iv32
  %18 = load double, double* %17, align 8
  %19 = fadd double %18, %16
  store double %19, double* %8, align 8
  %indvars.iv.next30.2 = or i64 %indvars.iv29, 3
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next30.2, i64 %indvars.iv32
  %21 = load double, double* %20, align 8
  %22 = fadd double %21, %19
  store double %22, double* %8, align 8
  %indvars.iv.next30.3 = add nsw i64 %indvars.iv29, 4
  %exitcond31.3 = icmp eq i64 %indvars.iv.next30.3, 1400
  br i1 %exitcond31.3, label %23, label %9

; <label>:23:                                     ; preds = %9
  %24 = fdiv double %22, %2
  store double %24, double* %8, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next33, 1200
  br i1 %exitcond34, label %._crit_edge5.preheader.preheader, label %7

._crit_edge5.preheader.preheader:                 ; preds = %23
  %scevgep38 = getelementptr double, double* %5, i64 1200
  br label %._crit_edge5.preheader

._crit_edge5.preheader:                           ; preds = %._crit_edge5.preheader.preheader, %._crit_edge
  %indvars.iv26 = phi i64 [ %25, %._crit_edge ], [ 0, %._crit_edge5.preheader.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv26, i64 0
  %25 = add i64 %indvars.iv26, 1
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %3, i64 %25, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep38
  %bound1 = icmp ugt double* %scevgep36, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge5.preheader48, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge5.preheader
  br label %vector.body

._crit_edge5.preheader48:                         ; preds = %._crit_edge5.preheader
  br label %._crit_edge5

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %26 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %27 = bitcast double* %26 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %27, align 8, !alias.scope !1
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv26, i64 %offset.idx
  %29 = bitcast double* %28 to <8 x double>*
  %wide.vec43 = load <8 x double>, <8 x double>* %29, align 8, !alias.scope !4, !noalias !1
  %30 = fsub <8 x double> %wide.vec43, %wide.vec
  %31 = shufflevector <8 x double> %30, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %32 = shufflevector <8 x double> %30, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %33 = shufflevector <8 x double> %30, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %34 = or i64 %offset.idx, 3
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv26, i64 %34
  %36 = shufflevector <8 x double> %30, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %37 = getelementptr double, double* %35, i64 -3
  %38 = bitcast double* %37 to <8 x double>*
  %39 = shufflevector <2 x double> %31, <2 x double> %32, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %40 = shufflevector <2 x double> %33, <2 x double> %36, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %39, <4 x double> %40, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %38, align 8, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 2
  %41 = icmp eq i64 %index.next, 300
  br i1 %41, label %._crit_edge.loopexit49, label %vector.body, !llvm.loop !6

._crit_edge6.preheader:                           ; preds = %._crit_edge
  %42 = fadd double %2, -1.000000e+00
  br label %.lr.ph

._crit_edge5:                                     ; preds = %._crit_edge5.preheader48, %._crit_edge5
  %indvars.iv23 = phi i64 [ %indvars.iv.next24.3, %._crit_edge5 ], [ 0, %._crit_edge5.preheader48 ]
  %43 = getelementptr inbounds double, double* %5, i64 %indvars.iv23
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv23
  %46 = load double, double* %45, align 8
  %47 = fsub double %46, %44
  store double %47, double* %45, align 8
  %indvars.iv.next24 = or i64 %indvars.iv23, 1
  %48 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next24
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv.next24
  %51 = load double, double* %50, align 8
  %52 = fsub double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next24.1 = or i64 %indvars.iv23, 2
  %53 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next24.1
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv.next24.1
  %56 = load double, double* %55, align 8
  %57 = fsub double %56, %54
  store double %57, double* %55, align 8
  %indvars.iv.next24.2 = or i64 %indvars.iv23, 3
  %58 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next24.2
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv.next24.2
  %61 = load double, double* %60, align 8
  %62 = fsub double %61, %59
  store double %62, double* %60, align 8
  %indvars.iv.next24.3 = add nsw i64 %indvars.iv23, 4
  %exitcond25.3 = icmp eq i64 %indvars.iv.next24.3, 1200
  br i1 %exitcond25.3, label %._crit_edge.loopexit, label %._crit_edge5, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %._crit_edge5
  br label %._crit_edge

._crit_edge.loopexit49:                           ; preds = %vector.body
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit49, %._crit_edge.loopexit
  %exitcond28 = icmp eq i64 %25, 1400
  br i1 %exitcond28, label %._crit_edge6.preheader, label %._crit_edge5.preheader

.lr.ph:                                           ; preds = %._crit_edge6.preheader, %._crit_edge6
  %indvars.iv20 = phi i64 [ 0, %._crit_edge6.preheader ], [ %indvars.iv.next21, %._crit_edge6 ]
  br label %63

; <label>:63:                                     ; preds = %._crit_edge7, %.lr.ph
  %indvars.iv17 = phi i64 [ %indvars.iv20, %.lr.ph ], [ %indvars.iv.next18, %._crit_edge7 ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv17
  store double 0.000000e+00, double* %64, align 8
  br label %65

; <label>:65:                                     ; preds = %65, %63
  %66 = phi double [ 0.000000e+00, %63 ], [ %78, %65 ]
  %indvars.iv = phi i64 [ 0, %63 ], [ %indvars.iv.next.1, %65 ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv20
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv17
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %66, %71
  store double %72, double* %64, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv20
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv17
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fadd double %72, %77
  store double %78, double* %64, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge7, label %65

._crit_edge7:                                     ; preds = %65
  %79 = fdiv double %78, %42
  store double %79, double* %64, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv20
  store double %79, double* %80, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next18, 1200
  br i1 %exitcond, label %._crit_edge6, label %63

._crit_edge6:                                     ; preds = %._crit_edge7
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 1200
  br i1 %exitcond22, label %81, label %.lr.ph

; <label>:81:                                     ; preds = %._crit_edge6
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %19, %2
  %indvars.iv5 = phi i64 [ 0, %2 ], [ %indvars.iv.next6, %19 ]
  %7 = mul nuw nsw i64 %indvars.iv5, 1200
  br label %8

; <label>:8:                                      ; preds = %._crit_edge2, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge2 ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge2

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %19, label %8

; <label>:19:                                     ; preds = %._crit_edge2
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond7, label %20, label %._crit_edge.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
