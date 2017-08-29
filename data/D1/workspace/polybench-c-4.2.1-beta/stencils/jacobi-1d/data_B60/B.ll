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
  tail call fastcc void @init_array(double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to double*
  %8 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_jacobi_1d(double* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(double* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double*, double*) unnamed_addr #2 {
.lr.ph:
  br label %2

; <label>:2:                                      ; preds = %.lr.ph, %2
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %2 ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %16, %2 ]
  %3 = sitofp i32 %storemerge1 to double
  %4 = sext i32 %storemerge1 to i64
  %5 = getelementptr inbounds double, double* %0, i64 %4
  %6 = trunc i64 %indvars.iv to i32
  %7 = sitofp i32 %6 to double
  %8 = insertelement <2 x double> undef, double %3, i32 0
  %9 = insertelement <2 x double> %8, double %7, i32 1
  %10 = fadd <2 x double> %9, <double 2.000000e+00, double 3.000000e+00>
  %11 = fdiv <2 x double> %10, <double 2.000000e+03, double 2.000000e+03>
  %12 = extractelement <2 x double> %11, i32 0
  %13 = extractelement <2 x double> %11, i32 1
  store double %12, double* %5, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %13, double* %14, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %15 = icmp slt i64 %indvars.iv.next, 2000
  %16 = trunc i64 %indvars.iv.next to i32
  br i1 %15, label %2, label %.loopexit

.loopexit:                                        ; preds = %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(double*, double*) unnamed_addr #2 {
._crit_edge.lr.ph:
  %scevgep = getelementptr double, double* %0, i64 1
  %scevgep41 = getelementptr double, double* %0, i64 1999
  %scevgep43 = getelementptr double, double* %1, i64 2000
  %scevgep61 = getelementptr double, double* %1, i64 1
  %scevgep64 = getelementptr double, double* %1, i64 1999
  %scevgep66 = getelementptr double, double* %0, i64 2000
  %bound068 = icmp ult double* %scevgep61, %scevgep66
  %bound169 = icmp ugt double* %scevgep64, %0
  %memcheck.conflict71 = and i1 %bound068, %bound169
  %bound0 = icmp ult double* %scevgep, %scevgep43
  %bound1 = icmp ugt double* %scevgep41, %1
  %memcheck.conflict = and i1 %bound0, %bound1
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.lr.ph, %._crit_edge7.us
  %2 = phi i32 [ %28, %._crit_edge7.us ], [ 0, %._crit_edge.lr.ph ]
  br i1 %memcheck.conflict71, label %scalar.ph53.preheader, label %vector.body51.preheader

vector.body51.preheader:                          ; preds = %._crit_edge.us
  br label %vector.body51

scalar.ph53.preheader.loopexit:                   ; preds = %vector.body51
  br label %scalar.ph53.preheader

scalar.ph53.preheader:                            ; preds = %scalar.ph53.preheader.loopexit, %._crit_edge.us
  %indvars.iv.ph = phi i64 [ 1, %._crit_edge.us ], [ 1997, %scalar.ph53.preheader.loopexit ]
  br label %scalar.ph53

vector.body51:                                    ; preds = %vector.body51.preheader, %vector.body51
  %index74 = phi i64 [ %index.next75, %vector.body51 ], [ 0, %vector.body51.preheader ]
  %offset.idx79 = or i64 %index74, 1
  %3 = add nsw i64 %offset.idx79, -1
  %4 = getelementptr inbounds double, double* %0, i64 %3
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr inbounds double, double* %0, i64 %offset.idx79
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = fadd <2 x double> %wide.load84, %wide.load86
  %13 = fadd <2 x double> %wide.load85, %wide.load87
  %14 = add nuw nsw i64 %offset.idx79, 1
  %15 = getelementptr inbounds double, double* %0, i64 %14
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = fadd <2 x double> %12, %wide.load88
  %20 = fadd <2 x double> %13, %wide.load89
  %21 = fmul <2 x double> %19, <double 3.333300e-01, double 3.333300e-01>
  %22 = fmul <2 x double> %20, <double 3.333300e-01, double 3.333300e-01>
  %23 = getelementptr inbounds double, double* %1, i64 %offset.idx79
  %24 = bitcast double* %23 to <2 x double>*
  store <2 x double> %21, <2 x double>* %24, align 8, !alias.scope !4, !noalias !1
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> %22, <2 x double>* %26, align 8, !alias.scope !4, !noalias !1
  %index.next75 = add i64 %index74, 4
  %27 = icmp eq i64 %index.next75, 1996
  br i1 %27, label %scalar.ph53.preheader.loopexit, label %vector.body51, !llvm.loop !6

._crit_edge7.us:                                  ; preds = %.lr.ph6.us
  %28 = add nsw i32 %2, 1
  %29 = icmp slt i32 %28, 500
  br i1 %29, label %._crit_edge.us, label %.loopexit

.lr.ph6.us:                                       ; preds = %.lr.ph6.us.preheader, %.lr.ph6.us
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %.lr.ph6.us ], [ %indvars.iv29.ph, %.lr.ph6.us.preheader ]
  %30 = add nsw i64 %indvars.iv29, -1
  %31 = getelementptr inbounds double, double* %1, i64 %30
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds double, double* %1, i64 %indvars.iv29
  %34 = load double, double* %33, align 8
  %35 = fadd double %32, %34
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %36 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next30
  %37 = load double, double* %36, align 8
  %38 = fadd double %35, %37
  %39 = fmul double %38, 3.333300e-01
  %40 = getelementptr inbounds double, double* %0, i64 %indvars.iv29
  store double %39, double* %40, align 8
  %41 = icmp slt i64 %indvars.iv.next30, 1999
  br i1 %41, label %.lr.ph6.us, label %._crit_edge7.us, !llvm.loop !9

scalar.ph53:                                      ; preds = %scalar.ph53.preheader, %scalar.ph53
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph53 ], [ %indvars.iv.ph, %scalar.ph53.preheader ]
  %42 = add nsw i64 %indvars.iv, -1
  %43 = getelementptr inbounds double, double* %0, i64 %42
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = fadd double %44, %46
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %51 = fmul double %50, 3.333300e-01
  %52 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %51, double* %52, align 8
  %53 = icmp slt i64 %indvars.iv.next, 1999
  br i1 %53, label %scalar.ph53, label %vector.memcheck, !llvm.loop !10

vector.memcheck:                                  ; preds = %scalar.ph53
  br i1 %memcheck.conflict, label %.lr.ph6.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

.lr.ph6.us.preheader.loopexit:                    ; preds = %vector.body
  br label %.lr.ph6.us.preheader

.lr.ph6.us.preheader:                             ; preds = %.lr.ph6.us.preheader.loopexit, %vector.memcheck
  %indvars.iv29.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %.lr.ph6.us.preheader.loopexit ]
  br label %.lr.ph6.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %54 = add nsw i64 %offset.idx, -1
  %55 = getelementptr inbounds double, double* %1, i64 %54
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !11
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !11
  %59 = getelementptr inbounds double, double* %1, i64 %offset.idx
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !11
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !11
  %63 = fadd <2 x double> %wide.load, %wide.load47
  %64 = fadd <2 x double> %wide.load46, %wide.load48
  %65 = add nuw nsw i64 %offset.idx, 1
  %66 = getelementptr inbounds double, double* %1, i64 %65
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !11
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !11
  %70 = fadd <2 x double> %63, %wide.load49
  %71 = fadd <2 x double> %64, %wide.load50
  %72 = fmul <2 x double> %70, <double 3.333300e-01, double 3.333300e-01>
  %73 = fmul <2 x double> %71, <double 3.333300e-01, double 3.333300e-01>
  %74 = getelementptr inbounds double, double* %0, i64 %offset.idx
  %75 = bitcast double* %74 to <2 x double>*
  store <2 x double> %72, <2 x double>* %75, align 8, !alias.scope !14, !noalias !11
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  store <2 x double> %73, <2 x double>* %77, align 8, !alias.scope !14, !noalias !11
  %index.next = add i64 %index, 4
  %78 = icmp eq i64 %index.next, 1996
  br i1 %78, label %.lr.ph6.us.preheader.loopexit, label %vector.body, !llvm.loop !16

.loopexit:                                        ; preds = %._crit_edge7.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double*) unnamed_addr #0 {
.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %5

; <label>:5:                                      ; preds = %.lr.ph, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %15, %._crit_edge ]
  %6 = srem i32 %storemerge1, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %5
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %5, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %14 = icmp slt i64 %indvars.iv.next, 2000
  %15 = trunc i64 %indvars.iv.next to i32
  br i1 %14, label %5, label %.loopexit

.loopexit:                                        ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !7, !8}
