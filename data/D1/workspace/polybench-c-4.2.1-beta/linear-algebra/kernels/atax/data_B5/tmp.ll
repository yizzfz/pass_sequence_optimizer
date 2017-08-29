; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [2100 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2100, double* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [2100 x double]* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph9.preheader:
  br label %.lr.ph9

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ 0, %.preheader.us ]
  %4 = add nuw nsw i64 %indvars.iv, %indvars.iv11
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 2100
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 9.500000e+03
  %9 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  store double %8, double* %9, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = add nuw nsw i64 %indvars.iv.next, %indvars.iv11
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2100
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 9.500000e+03
  %15 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv.next
  store double %14, double* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, 1900
  br i1 %exitcond, label %._crit_edge6, label %.preheader.us

.lr.ph9:                                          ; preds = %.lr.ph9.preheader, %.lr.ph9
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %.lr.ph9 ], [ 0, %.lr.ph9.preheader ]
  %16 = trunc i64 %indvars.iv15 to i32
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.100000e+03
  %19 = fadd double %18, 1.000000e+00
  %20 = getelementptr inbounds double, double* %3, i64 %indvars.iv15
  store double %19, double* %20, align 8
  %indvars.iv.next16 = or i64 %indvars.iv15, 1
  %21 = trunc i64 %indvars.iv.next16 to i32
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 2.100000e+03
  %24 = fadd double %23, 1.000000e+00
  %25 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next16
  store double %24, double* %25, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next16.1, 2100
  br i1 %exitcond18.1, label %.preheader.us.preheader, label %.lr.ph9

.preheader.us.preheader:                          ; preds = %.lr.ph9
  br label %.preheader.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax(i32, i32, [2100 x double]* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
.preheader3.loopexit:
  %6 = bitcast double* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 16800, i32 8, i1 false)
  %scevgep44 = getelementptr double, double* %4, i64 2100
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge.us, %.preheader3.loopexit
  %indvars.iv29 = phi i64 [ 0, %.preheader3.loopexit ], [ %indvars.iv.next30, %._crit_edge.us ]
  %7 = getelementptr inbounds double, double* %5, i64 %indvars.iv29
  store double 0.000000e+00, double* %7, align 8
  br label %.lr.ph8.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph6.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next30, 1900
  br i1 %exitcond, label %._crit_edge9, label %.lr.ph8.split.us

.lr.ph6.us:                                       ; preds = %.lr.ph6.us.preheader, %.lr.ph6.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.1, %.lr.ph6.us ], [ %indvars.iv22.ph, %.lr.ph6.us.preheader ]
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv22
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv22
  %11 = load double, double* %10, align 8
  %12 = load double, double* %7, align 8
  %13 = fmul double %11, %12
  %14 = fadd double %9, %13
  store double %14, double* %8, align 8
  %indvars.iv.next23 = or i64 %indvars.iv22, 1
  %15 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next23
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv.next23
  %18 = load double, double* %17, align 8
  %19 = load double, double* %7, align 8
  %20 = fmul double %18, %19
  %21 = fadd double %16, %20
  store double %21, double* %15, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond.128 = icmp eq i64 %indvars.iv.next23.1, 2100
  br i1 %exitcond.128, label %._crit_edge.us.loopexit, label %.lr.ph6.us, !llvm.loop !1

.lr.ph8.split.us.new:                             ; preds = %.lr.ph8.split.us, %.lr.ph8.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph8.split.us.new ], [ 0, %.lr.ph8.split.us ]
  %22 = load double, double* %7, align 8
  %23 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %22, %27
  store double %28, double* %7, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %28, %33
  store double %34, double* %7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %.lr.ph6.us.preheader41, label %.lr.ph8.split.us.new

.lr.ph6.us.preheader41:                           ; preds = %.lr.ph8.split.us.new
  %scevgep47 = getelementptr [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 0
  %scevgep50 = getelementptr [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 2100
  %bound0 = icmp ugt double* %scevgep50, %4
  %bound1 = icmp ult double* %scevgep47, %scevgep44
  %found.conflict = and i1 %bound0, %bound1
  %bound053 = icmp ugt double* %7, %4
  %bound154 = icmp ult double* %7, %scevgep44
  %found.conflict55 = and i1 %bound053, %bound154
  %conflict.rdx = or i1 %found.conflict, %found.conflict55
  br i1 %conflict.rdx, label %.lr.ph6.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph6.us.preheader41
  br label %vector.body

.lr.ph6.us.preheader:                             ; preds = %middle.block, %.lr.ph6.us.preheader41
  %indvars.iv22.ph = phi i64 [ 0, %.lr.ph6.us.preheader41 ], [ 2100, %middle.block ]
  br label %.lr.ph6.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %35 = shl i64 %index, 1
  %36 = getelementptr inbounds double, double* %4, i64 %35
  %37 = bitcast double* %36 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %37, align 8, !alias.scope !4, !noalias !7
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec56 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %38 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %35
  %39 = bitcast double* %38 to <4 x double>*
  %wide.vec57 = load <4 x double>, <4 x double>* %39, align 8, !alias.scope !10
  %strided.vec58 = shufflevector <4 x double> %wide.vec57, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec59 = shufflevector <4 x double> %wide.vec57, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %40 = load double, double* %7, align 8, !alias.scope !11
  %41 = insertelement <2 x double> undef, double %40, i32 0
  %42 = shufflevector <2 x double> %41, <2 x double> undef, <2 x i32> zeroinitializer
  %43 = fmul <2 x double> %strided.vec58, %42
  %44 = fadd <2 x double> %strided.vec, %43
  %45 = or i64 %35, 1
  %46 = getelementptr inbounds double, double* %4, i64 %45
  %47 = load double, double* %7, align 8, !alias.scope !11
  %48 = insertelement <2 x double> undef, double %47, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = fmul <2 x double> %strided.vec59, %49
  %51 = fadd <2 x double> %strided.vec56, %50
  %52 = getelementptr double, double* %46, i64 -1
  %53 = bitcast double* %52 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %44, <2 x double> %51, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %53, align 8, !alias.scope !4, !noalias !7
  %index.next = add i64 %index, 2
  %54 = icmp eq i64 %index.next, 1050
  br i1 %54, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge.us, label %.lr.ph6.us.preheader

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %11
  %indvars.iv = phi i64 [ %indvars.iv.next, %11 ], [ 0, %.lr.ph.preheader ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %11

; <label>:11:                                     ; preds = %9, %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %11
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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

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
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8, !9}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = !{!8}
!11 = !{!9}
!12 = distinct !{!12, !2, !3}
