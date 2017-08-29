; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %5, double* %6)
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
  tail call fastcc void @print_array(i32 2000, double* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = sext i32 %0 to i64
  %7 = insertelement <2 x double> undef, double %5, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  %xtraiter = and i64 %6, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %9 = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, %8
  %10 = extractelement <2 x double> %9, i32 0
  %11 = extractelement <2 x double> %9, i32 1
  store double %10, double* %1, align 8
  store double %11, double* %2, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv2.unr = phi i64 [ 0, %.lr.ph ], [ 1, %.prol.preheader ]
  %12 = icmp eq i32 %0, 1
  br i1 %12, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %13

; <label>:13:                                     ; preds = %13, %.lr.ph.new
  %indvars.iv2 = phi i64 [ %indvars.iv2.unr, %.lr.ph.new ], [ %indvars.iv.next3.1, %13 ]
  %14 = trunc i64 %indvars.iv2 to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv2
  %17 = insertelement <2 x double> undef, double %15, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = fadd <2 x double> %18, <double 2.000000e+00, double 3.000000e+00>
  %20 = fdiv <2 x double> %19, %8
  %21 = bitcast double* %16 to <2 x double>*
  %22 = getelementptr inbounds double, double* %2, i64 %indvars.iv2
  %23 = bitcast double* %22 to <2 x double>*
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %24 = trunc i64 %indvars.iv.next3 to i32
  %25 = sitofp i32 %24 to double
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = fadd <2 x double> %27, <double 2.000000e+00, double 3.000000e+00>
  %29 = fdiv <2 x double> %28, %8
  %30 = shufflevector <2 x double> %20, <2 x double> %29, <2 x i32> <i32 0, i32 2>
  store <2 x double> %30, <2 x double>* %21, align 8
  %31 = shufflevector <2 x double> %20, <2 x double> %29, <2 x i32> <i32 1, i32 3>
  store <2 x double> %31, <2 x double>* %23, align 8
  %indvars.iv.next3.1 = add nsw i64 %indvars.iv2, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next3.1, %6
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %13

._crit_edge.loopexit.unr-lcssa:                   ; preds = %13
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double*, double*) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %..preheader3_crit_edge.lr.ph, label %._crit_edge

..preheader3_crit_edge.lr.ph:                     ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  br i1 %7, label %..preheader3_crit_edge.us.preheader, label %._crit_edge

..preheader3_crit_edge.us.preheader:              ; preds = %..preheader3_crit_edge.lr.ph
  %8 = sext i32 %6 to i64
  %9 = add nsw i64 %8, -1
  %10 = add nsw i64 %8, -2
  %xtraiter = and i64 %9, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %11 = icmp eq i64 %10, 0
  %12 = getelementptr inbounds double, double* %3, i64 1
  %13 = getelementptr inbounds double, double* %3, i64 2
  %14 = getelementptr inbounds double, double* %2, i64 1
  %15 = getelementptr inbounds double, double* %2, i64 1
  %16 = getelementptr inbounds double, double* %2, i64 2
  %17 = getelementptr inbounds double, double* %3, i64 1
  br label %..preheader3_crit_edge.us

..preheader3_crit_edge.us:                        ; preds = %.preheader._crit_edge.us, %..preheader3_crit_edge.us.preheader
  %18 = phi i32 [ 0, %..preheader3_crit_edge.us.preheader ], [ %69, %.preheader._crit_edge.us ]
  br i1 %lcmp.mod, label %.preheader3.us.prol.loopexit.unr-lcssa, label %.preheader3.us.prol.preheader

.preheader3.us.prol.preheader:                    ; preds = %..preheader3_crit_edge.us
  %19 = load double, double* %2, align 8
  %20 = load double, double* %15, align 8
  %21 = fadd double %19, %20
  %22 = load double, double* %16, align 8
  %23 = fadd double %21, %22
  %24 = fmul double %23, 3.333300e-01
  store double %24, double* %17, align 8
  br label %.preheader3.us.prol.loopexit.unr-lcssa

.preheader3.us.prol.loopexit.unr-lcssa:           ; preds = %..preheader3_crit_edge.us, %.preheader3.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 2, %.preheader3.us.prol.preheader ], [ 1, %..preheader3_crit_edge.us ]
  br i1 %11, label %.preheader.us.preheader, label %..preheader3_crit_edge.us.new

..preheader3_crit_edge.us.new:                    ; preds = %.preheader3.us.prol.loopexit.unr-lcssa
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us, %..preheader3_crit_edge.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %..preheader3_crit_edge.us.new ], [ %indvars.iv.next.1, %.preheader3.us ]
  %25 = add nsw i64 %indvars.iv, -1
  %26 = getelementptr inbounds double, double* %2, i64 %25
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = fadd double %27, %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fadd double %30, %32
  %34 = fmul double %33, 3.333300e-01
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %34, double* %35, align 8
  %36 = load double, double* %28, align 8
  %37 = load double, double* %31, align 8
  %38 = fadd double %36, %37
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %39 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %40 = load double, double* %39, align 8
  %41 = fadd double %38, %40
  %42 = fmul double %41, 3.333300e-01
  %43 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  store double %42, double* %43, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %8
  br i1 %exitcond.1, label %.preheader.us.preheader.unr-lcssa, label %.preheader3.us

.preheader.us.preheader.unr-lcssa:                ; preds = %.preheader3.us
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader3.us.prol.loopexit.unr-lcssa, %.preheader.us.preheader.unr-lcssa
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit.unr-lcssa, label %.preheader.us.prol.preheader

.preheader.us.prol.preheader:                     ; preds = %.preheader.us.preheader
  %44 = load double, double* %3, align 8
  %45 = load double, double* %12, align 8
  %46 = fadd double %44, %45
  %47 = load double, double* %13, align 8
  %48 = fadd double %46, %47
  %49 = fmul double %48, 3.333300e-01
  store double %49, double* %14, align 8
  br label %.preheader.us.prol.loopexit.unr-lcssa

.preheader.us.prol.loopexit.unr-lcssa:            ; preds = %.preheader.us.preheader, %.preheader.us.prol.preheader
  %indvars.iv28.unr.ph = phi i64 [ 2, %.preheader.us.prol.preheader ], [ 1, %.preheader.us.preheader ]
  br i1 %11, label %.preheader._crit_edge.us, label %.preheader.us.preheader.new

.preheader.us.preheader.new:                      ; preds = %.preheader.us.prol.loopexit.unr-lcssa
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us, %.preheader.us.preheader.new
  %indvars.iv28 = phi i64 [ %indvars.iv28.unr.ph, %.preheader.us.preheader.new ], [ %indvars.iv.next29.1, %.preheader.us ]
  %50 = add nsw i64 %indvars.iv28, -1
  %51 = getelementptr inbounds double, double* %3, i64 %50
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds double, double* %3, i64 %indvars.iv28
  %54 = load double, double* %53, align 8
  %55 = fadd double %52, %54
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %56 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next29
  %57 = load double, double* %56, align 8
  %58 = fadd double %55, %57
  %59 = fmul double %58, 3.333300e-01
  %60 = getelementptr inbounds double, double* %2, i64 %indvars.iv28
  store double %59, double* %60, align 8
  %61 = load double, double* %53, align 8
  %62 = load double, double* %56, align 8
  %63 = fadd double %61, %62
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  %64 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next29.1
  %65 = load double, double* %64, align 8
  %66 = fadd double %63, %65
  %67 = fmul double %66, 3.333300e-01
  %68 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next29
  store double %67, double* %68, align 8
  %exitcond32.1 = icmp eq i64 %indvars.iv.next29.1, %8
  br i1 %exitcond32.1, label %.preheader._crit_edge.us.unr-lcssa, label %.preheader.us

.preheader._crit_edge.us.unr-lcssa:               ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader.us.prol.loopexit.unr-lcssa, %.preheader._crit_edge.us.unr-lcssa
  %69 = add nuw nsw i32 %18, 1
  %exitcond33 = icmp eq i32 %69, %0
  br i1 %exitcond33, label %._crit_edge.loopexit, label %..preheader3_crit_edge.us

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %..preheader3_crit_edge.lr.ph, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %._crit_edge3

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %9

; <label>:9:                                      ; preds = %._crit_edge._crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %18, %._crit_edge._crit_edge ]
  %10 = srem i32 %storemerge1, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %9
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %8
  br i1 %exitcond, label %._crit_edge3.loopexit, label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %18 = trunc i64 %indvars.iv.next to i32
  br label %9

._crit_edge3.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

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
