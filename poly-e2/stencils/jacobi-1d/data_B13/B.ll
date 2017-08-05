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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %arraydecay = bitcast i8* %call to double*
  %arraydecay2 = bitcast i8* %call1 to double*
  tail call fastcc void @init_array(i32 2000, double* %arraydecay, double* %arraydecay2)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %arraydecay, double* %arraydecay2)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 2000, double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* %A, double* %B) unnamed_addr #0 {
for.inc.lr.ph:
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %0 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %0 to double
  %add = fadd double %conv, 2.000000e+00
  %div = fdiv double %add, 2.000000e+03
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  store double %div, double* %arrayidx, align 8
  %add3 = fadd double %conv, 3.000000e+00
  %div5 = fdiv double %add3, 2.000000e+03
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div5, double* %arrayidx7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) unnamed_addr #0 {
for.cond1.preheader.us.preheader:
  %scevgep = getelementptr double, double* %A, i64 1
  %scevgep79 = getelementptr double, double* %A, i64 1999
  %scevgep82 = getelementptr double, double* %B, i64 2000
  %scevgep96 = getelementptr double, double* %B, i64 1
  %scevgep98 = getelementptr double, double* %B, i64 1999
  %scevgep101 = getelementptr double, double* %A, i64 2000
  %bound0103 = icmp ult double* %scevgep96, %scevgep101
  %bound1104 = icmp ugt double* %scevgep98, %A
  %found.conflict105 = and i1 %bound0103, %bound1104
  %bound0 = icmp ult double* %scevgep, %scevgep82
  %bound1 = icmp ugt double* %scevgep79, %B
  %found.conflict = and i1 %bound0, %bound1
  br label %vector.memcheck107

vector.memcheck107:                               ; preds = %for.inc33.us, %for.cond1.preheader.us.preheader
  %t.025.us = phi i32 [ %inc34.us, %for.inc33.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br i1 %found.conflict105, label %for.inc.us.preheader, label %vector.body91.preheader

vector.body91.preheader:                          ; preds = %vector.memcheck107
  br label %vector.body91

for.inc.us.preheader.loopexit:                    ; preds = %vector.body91
  br label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.preheader.loopexit, %vector.memcheck107
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck107 ], [ 1997, %for.inc.us.preheader.loopexit ]
  br label %for.inc.us

vector.body91:                                    ; preds = %vector.body91.preheader, %vector.body91
  %index109 = phi i64 [ %index.next110, %vector.body91 ], [ 0, %vector.body91.preheader ]
  %0 = shl i64 %index109, 1
  %offset.idx113 = or i64 %0, 1
  %1 = getelementptr inbounds double, double* %A, i64 %0
  %2 = bitcast double* %1 to <4 x double>*
  %wide.vec117 = load <4 x double>, <4 x double>* %2, align 8, !alias.scope !1
  %strided.vec118 = shufflevector <4 x double> %wide.vec117, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec119 = shufflevector <4 x double> %wide.vec117, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %3 = fadd <2 x double> %strided.vec118, %strided.vec119
  %4 = add nuw nsw i64 %offset.idx113, 1
  %5 = getelementptr inbounds double, double* %A, i64 %4
  %6 = getelementptr double, double* %5, i64 -1
  %7 = bitcast double* %6 to <4 x double>*
  %wide.vec120 = load <4 x double>, <4 x double>* %7, align 8, !alias.scope !1
  %strided.vec122 = shufflevector <4 x double> %wide.vec120, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %8 = fadd <2 x double> %3, %strided.vec122
  %9 = fmul <2 x double> %8, <double 3.333300e-01, double 3.333300e-01>
  %10 = bitcast double* %5 to <4 x double>*
  %wide.vec123 = load <4 x double>, <4 x double>* %10, align 8, !alias.scope !1
  %strided.vec125 = shufflevector <4 x double> %wide.vec123, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %11 = fadd <4 x double> %wide.vec120, %wide.vec123
  %12 = shufflevector <4 x double> %11, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %13 = fadd <2 x double> %12, %strided.vec125
  %14 = fmul <2 x double> %13, <double 3.333300e-01, double 3.333300e-01>
  %15 = getelementptr inbounds double, double* %B, i64 %4
  %16 = getelementptr double, double* %15, i64 -1
  %17 = bitcast double* %16 to <4 x double>*
  %interleaved.vec126 = shufflevector <2 x double> %9, <2 x double> %14, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec126, <4 x double>* %17, align 8, !alias.scope !4, !noalias !1
  %index.next110 = add i64 %index109, 2
  %18 = icmp eq i64 %index.next110, 998
  br i1 %18, label %for.inc.us.preheader.loopexit, label %vector.body91, !llvm.loop !6

for.inc33.us:                                     ; preds = %for.inc30.us
  %inc34.us = add nuw nsw i32 %t.025.us, 1
  %exitcond77 = icmp eq i32 %inc34.us, 500
  br i1 %exitcond77, label %for.end35, label %vector.memcheck107

for.inc30.us:                                     ; preds = %for.inc30.us.preheader, %for.inc30.us
  %indvars.iv73 = phi i64 [ %indvars.iv.next74.1, %for.inc30.us ], [ %indvars.iv73.ph, %for.inc30.us.preheader ]
  %19 = add nsw i64 %indvars.iv73, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %19
  %20 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv73
  %21 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %20, %21
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next74
  %22 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %22
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv73
  store double %mul27.us, double* %arrayidx29.us, align 8
  %23 = load double, double* %arrayidx21.us, align 8
  %24 = load double, double* %arrayidx25.us, align 8
  %add22.us.1 = fadd double %23, %24
  %indvars.iv.next74.1 = add nuw nsw i64 %indvars.iv73, 2
  %arrayidx25.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next74.1
  %25 = load double, double* %arrayidx25.us.1, align 8
  %add26.us.1 = fadd double %add22.us.1, %25
  %mul27.us.1 = fmul double %add26.us.1, 3.333300e-01
  %arrayidx29.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next74
  store double %mul27.us.1, double* %arrayidx29.us.1, align 8
  %exitcond76.1 = icmp eq i64 %indvars.iv.next74.1, 1999
  br i1 %exitcond76.1, label %for.inc33.us, label %for.inc30.us, !llvm.loop !9

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader ]
  %26 = add nsw i64 %indvars.iv, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %26
  %27 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %28 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %27, %28
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %29 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %29
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul.us, double* %arrayidx12.us, align 8
  %30 = load double, double* %arrayidx6.us, align 8
  %31 = load double, double* %arrayidx9.us, align 8
  %add.us.1 = fadd double %30, %31
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx9.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %32 = load double, double* %arrayidx9.us.1, align 8
  %add10.us.1 = fadd double %add.us.1, %32
  %mul.us.1 = fmul double %add10.us.1, 3.333300e-01
  %arrayidx12.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.us.1, double* %arrayidx12.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1999
  br i1 %exitcond.1, label %vector.memcheck, label %for.inc.us, !llvm.loop !10

vector.memcheck:                                  ; preds = %for.inc.us
  br i1 %found.conflict, label %for.inc30.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.inc30.us.preheader.loopexit:                  ; preds = %vector.body
  br label %for.inc30.us.preheader

for.inc30.us.preheader:                           ; preds = %for.inc30.us.preheader.loopexit, %vector.memcheck
  %indvars.iv73.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %for.inc30.us.preheader.loopexit ]
  br label %for.inc30.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %33 = shl i64 %index, 1
  %offset.idx = or i64 %33, 1
  %34 = getelementptr inbounds double, double* %B, i64 %33
  %35 = bitcast double* %34 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %35, align 8, !alias.scope !11
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec84 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %36 = fadd <2 x double> %strided.vec, %strided.vec84
  %37 = add nuw nsw i64 %offset.idx, 1
  %38 = getelementptr inbounds double, double* %B, i64 %37
  %39 = getelementptr double, double* %38, i64 -1
  %40 = bitcast double* %39 to <4 x double>*
  %wide.vec85 = load <4 x double>, <4 x double>* %40, align 8, !alias.scope !11
  %strided.vec87 = shufflevector <4 x double> %wide.vec85, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %41 = fadd <2 x double> %36, %strided.vec87
  %42 = fmul <2 x double> %41, <double 3.333300e-01, double 3.333300e-01>
  %43 = bitcast double* %38 to <4 x double>*
  %wide.vec88 = load <4 x double>, <4 x double>* %43, align 8, !alias.scope !11
  %strided.vec90 = shufflevector <4 x double> %wide.vec88, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %44 = fadd <4 x double> %wide.vec85, %wide.vec88
  %45 = shufflevector <4 x double> %44, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %46 = fadd <2 x double> %45, %strided.vec90
  %47 = fmul <2 x double> %46, <double 3.333300e-01, double 3.333300e-01>
  %48 = getelementptr inbounds double, double* %A, i64 %37
  %49 = getelementptr double, double* %48, i64 -1
  %50 = bitcast double* %49 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %42, <2 x double> %47, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %50, align 8, !alias.scope !14, !noalias !11
  %index.next = add i64 %index, 2
  %51 = icmp eq i64 %index.next, 998
  br i1 %51, label %for.inc30.us.preheader.loopexit, label %vector.body, !llvm.loop !16

for.end35:                                        ; preds = %for.inc33.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %A) unnamed_addr #0 {
for.body.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #4
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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
