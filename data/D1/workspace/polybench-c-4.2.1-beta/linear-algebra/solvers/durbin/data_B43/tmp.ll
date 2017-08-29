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
  br i1 %7, label %8, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %.._crit_edge_crit_edge9

.._crit_edge_crit_edge9:                          ; preds = %8
  br label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(double* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge9, %.._crit_edge_crit_edge, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge.._crit_edge_crit_edge ]
  %2 = sub nuw nsw i64 2001, %indvars.iv
  %3 = trunc i64 %2 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  store double %4, double* %5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %6, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

; <label>:6:                                      ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(double* nocapture readonly, double* nocapture) unnamed_addr #2 {
  %3 = alloca [2000 x double], align 16
  %4 = load double, double* %0, align 8
  %5 = fsub double -0.000000e+00, %4
  store double %5, double* %1, align 8
  %6 = load double, double* %0, align 8
  %7 = fsub double -0.000000e+00, %6
  %8 = bitcast [2000 x double]* %3 to i8*
  %9 = bitcast double* %1 to i8*
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge8..lr.ph_crit_edge, %2
  %indvars.iv26 = phi i64 [ 1, %2 ], [ %indvars.iv.next27, %._crit_edge8..lr.ph_crit_edge ]
  %indvar = phi i64 [ 0, %2 ], [ %22, %._crit_edge8..lr.ph_crit_edge ]
  %10 = phi double [ %7, %2 ], [ %29, %._crit_edge8..lr.ph_crit_edge ]
  %.0309 = phi double [ 1.000000e+00, %2 ], [ %24, %._crit_edge8..lr.ph_crit_edge ]
  %11 = shl i64 %indvar, 3
  %12 = fmul double %10, %10
  %13 = fsub double 1.000000e+00, %12
  %14 = add nsw i64 %indvars.iv26, -1
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.._crit_edge29_crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge29.._crit_edge29_crit_edge ]
  %.01 = phi double [ 0.000000e+00, %.lr.ph ], [ %21, %._crit_edge29.._crit_edge29_crit_edge ]
  %15 = sub nsw i64 %14, %indvars.iv
  %16 = getelementptr inbounds double, double* %0, i64 %15
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %.01, %20
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv26
  br i1 %exitcond, label %.lr.ph5, label %._crit_edge29.._crit_edge29_crit_edge

._crit_edge29.._crit_edge29_crit_edge:            ; preds = %._crit_edge29
  br label %._crit_edge29

.lr.ph5:                                          ; preds = %._crit_edge29
  %22 = add nuw nsw i64 %indvar, 1
  %23 = add nuw nsw i64 %11, 8
  %24 = fmul double %.0309, %13
  %25 = getelementptr inbounds double, double* %0, i64 %indvars.iv26
  %26 = load double, double* %25, align 8
  %27 = fadd double %21, %26
  %28 = fsub double -0.000000e+00, %27
  %29 = fdiv double %28, %24
  %min.iters.check = icmp ult i64 %22, 4
  br i1 %min.iters.check, label %.lr.ph5.._crit_edge30.preheader_crit_edge, label %min.iters.checked

.lr.ph5.._crit_edge30.preheader_crit_edge:        ; preds = %.lr.ph5
  br label %._crit_edge30.preheader

min.iters.checked:                                ; preds = %.lr.ph5
  %n.vec = and i64 %22, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %min.iters.checked.._crit_edge30.preheader_crit_edge, label %vector.ph

min.iters.checked.._crit_edge30.preheader_crit_edge: ; preds = %min.iters.checked
  br label %._crit_edge30.preheader

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert36 = insertelement <2 x double> undef, double %29, i32 0
  %broadcast.splat37 = shufflevector <2 x double> %broadcast.splatinsert36, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %30 = getelementptr inbounds double, double* %1, i64 %index
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %31, align 8
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load32 = load <2 x double>, <2 x double>* %33, align 8
  %34 = sub nsw i64 %14, %index
  %35 = getelementptr inbounds double, double* %1, i64 %34
  %36 = getelementptr double, double* %35, i64 -1
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %37, align 8
  %reverse = shufflevector <2 x double> %wide.load33, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %38 = getelementptr double, double* %35, i64 -2
  %39 = getelementptr double, double* %38, i64 -1
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %40, align 8
  %reverse35 = shufflevector <2 x double> %wide.load34, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %41 = fmul <2 x double> %broadcast.splat37, %reverse
  %42 = fmul <2 x double> %broadcast.splat37, %reverse35
  %43 = fadd <2 x double> %wide.load, %41
  %44 = fadd <2 x double> %wide.load32, %42
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %index
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> %43, <2 x double>* %46, align 16
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> %44, <2 x double>* %48, align 16
  %index.next = add i64 %index, 4
  %49 = icmp eq i64 %index.next, %n.vec
  br i1 %49, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %22, %n.vec
  br i1 %cmp.n, label %middle.block.._crit_edge8_crit_edge, label %middle.block.._crit_edge30.preheader_crit_edge

middle.block.._crit_edge30.preheader_crit_edge:   ; preds = %middle.block
  br label %._crit_edge30.preheader

middle.block.._crit_edge8_crit_edge:              ; preds = %middle.block
  br label %._crit_edge8

._crit_edge30.preheader:                          ; preds = %middle.block.._crit_edge30.preheader_crit_edge, %min.iters.checked.._crit_edge30.preheader_crit_edge, %.lr.ph5.._crit_edge30.preheader_crit_edge
  %indvars.iv14.ph = phi i64 [ 0, %min.iters.checked.._crit_edge30.preheader_crit_edge ], [ 0, %.lr.ph5.._crit_edge30.preheader_crit_edge ], [ %n.vec, %middle.block.._crit_edge30.preheader_crit_edge ]
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.._crit_edge30_crit_edge, %._crit_edge30.preheader
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge30.._crit_edge30_crit_edge ], [ %indvars.iv14.ph, %._crit_edge30.preheader ]
  %50 = getelementptr inbounds double, double* %1, i64 %indvars.iv14
  %51 = load double, double* %50, align 8
  %52 = sub nsw i64 %14, %indvars.iv14
  %53 = getelementptr inbounds double, double* %1, i64 %52
  %54 = load double, double* %53, align 8
  %55 = fmul double %29, %54
  %56 = fadd double %51, %55
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv14
  store double %56, double* %57, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next15, %indvars.iv26
  br i1 %exitcond19, label %._crit_edge8.loopexit, label %._crit_edge30.._crit_edge30_crit_edge, !llvm.loop !4

._crit_edge30.._crit_edge30_crit_edge:            ; preds = %._crit_edge30
  br label %._crit_edge30

._crit_edge8.loopexit:                            ; preds = %._crit_edge30
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %middle.block.._crit_edge8_crit_edge, %._crit_edge8.loopexit
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %9, i8* nonnull %8, i64 %23, i32 8, i1 false)
  %58 = getelementptr inbounds double, double* %1, i64 %indvars.iv26
  store double %29, double* %58, align 8
  %exitcond28 = icmp eq i64 %22, 1999
  br i1 %exitcond28, label %59, label %._crit_edge8..lr.ph_crit_edge

._crit_edge8..lr.ph_crit_edge:                    ; preds = %._crit_edge8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  br label %.lr.ph

; <label>:59:                                     ; preds = %._crit_edge8
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

._crit_edge2:                                     ; preds = %._crit_edge.._crit_edge2_crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge.._crit_edge2_crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge2.._crit_edge_crit_edge

._crit_edge2.._crit_edge_crit_edge:               ; preds = %._crit_edge2
  br label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge2
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2.._crit_edge_crit_edge, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge.._crit_edge2_crit_edge

._crit_edge.._crit_edge2_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge2

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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
