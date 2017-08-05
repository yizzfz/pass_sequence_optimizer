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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to double*
  %arraydecay2 = bitcast i8* %call1 to double*
  call fastcc void @init_array(i32 2000, double* %arraydecay, double* %arraydecay2)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %arraydecay, double* %arraydecay2)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 2000, double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next.1, %for.body ]
  %0 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %1 = insertelement <2 x double> undef, double %conv, i32 0
  %add.v.i0.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %add = fadd <2 x double> %add.v.i0.2, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add, <double 2.000000e+03, double 2.000000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div.v.r2, double* %arrayidx7, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %2 = trunc i64 %indvars.iv.next to i32
  %conv.1 = sitofp i32 %2 to double
  %arrayidx.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %3 = insertelement <2 x double> undef, double %conv.1, i32 0
  %add.v.i0.2.1 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %add.1 = fadd <2 x double> %add.v.i0.2.1, <double 2.000000e+00, double 3.000000e+00>
  %div.1 = fdiv <2 x double> %add.1, <double 2.000000e+03, double 2.000000e+03>
  %div.v.r1.1 = extractelement <2 x double> %div.1, i32 0
  %div.v.r2.1 = extractelement <2 x double> %div.1, i32 1
  store double %div.v.r1.1, double* %arrayidx.1, align 8
  %arrayidx7.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %div.v.r2.1, double* %arrayidx7.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %arrayidx6.prol = getelementptr double, double* %A, i64 1
  %arrayidx12.prol = getelementptr double, double* %B, i64 1
  %scevgep49 = getelementptr double, double* %B, i64 1999
  %scevgep55 = getelementptr double, double* %A, i64 2000
  %bound057 = icmp ult double* %arrayidx12.prol, %scevgep55
  %bound158 = icmp ugt double* %scevgep49, %A
  %found.conflict59 = and i1 %bound057, %bound158
  %scevgep22 = getelementptr double, double* %A, i64 1999
  %scevgep28 = getelementptr double, double* %B, i64 2000
  %bound0 = icmp ult double* %arrayidx6.prol, %scevgep28
  %bound1 = icmp ugt double* %scevgep22, %B
  %found.conflict = and i1 %bound0, %bound1
  br label %for.body

for.body:                                         ; preds = %for.end32, %entry
  %inc3411 = phi i32 [ 0, %entry ], [ %inc34, %for.end32 ]
  br i1 %found.conflict59, label %for.body3.preheader, label %vector.body37.preheader

vector.body37.preheader:                          ; preds = %for.body
  br label %vector.body37

vector.body37:                                    ; preds = %vector.body37.preheader, %vector.body37
  %index63 = phi i64 [ %index.next64, %vector.body37 ], [ 0, %vector.body37.preheader ]
  %0 = shl i64 %index63, 1
  %offset.idx68 = or i64 %0, 1
  %1 = getelementptr inbounds double, double* %A, i64 %0
  %2 = bitcast double* %1 to <4 x double>*
  %wide.vec72 = load <4 x double>, <4 x double>* %2, align 8, !alias.scope !1
  %strided.vec73 = shufflevector <4 x double> %wide.vec72, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec74 = shufflevector <4 x double> %wide.vec72, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %3 = fadd <2 x double> %strided.vec73, %strided.vec74
  %4 = add nuw nsw i64 %offset.idx68, 1
  %5 = getelementptr inbounds double, double* %A, i64 %4
  %6 = getelementptr double, double* %5, i64 -1
  %7 = bitcast double* %6 to <4 x double>*
  %wide.vec75 = load <4 x double>, <4 x double>* %7, align 8, !alias.scope !1
  %strided.vec77 = shufflevector <4 x double> %wide.vec75, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %8 = fadd <2 x double> %3, %strided.vec77
  %9 = fmul <2 x double> %8, <double 3.333300e-01, double 3.333300e-01>
  %10 = bitcast double* %5 to <4 x double>*
  %wide.vec78 = load <4 x double>, <4 x double>* %10, align 8, !alias.scope !1
  %strided.vec80 = shufflevector <4 x double> %wide.vec78, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %11 = fadd <4 x double> %wide.vec75, %wide.vec78
  %12 = shufflevector <4 x double> %11, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %13 = fadd <2 x double> %12, %strided.vec80
  %14 = fmul <2 x double> %13, <double 3.333300e-01, double 3.333300e-01>
  %15 = getelementptr inbounds double, double* %B, i64 %4
  %16 = getelementptr double, double* %15, i64 -1
  %17 = bitcast double* %16 to <4 x double>*
  %interleaved.vec81 = shufflevector <2 x double> %9, <2 x double> %14, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec81, <4 x double>* %17, align 8, !alias.scope !4, !noalias !1
  %index.next64 = add i64 %index63, 2
  %18 = icmp eq i64 %index.next64, 998
  br i1 %18, label %for.body3.preheader.loopexit, label %vector.body37, !llvm.loop !6

for.body3.preheader.loopexit:                     ; preds = %vector.body37
  br label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.preheader.loopexit, %for.body
  %indvars.iv.ph = phi i64 [ 1, %for.body ], [ 1997, %for.body3.preheader.loopexit ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %19 = add nsw i64 %indvars.iv, -1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %19
  %20 = load double, double* %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %21 = load double, double* %arrayidx6, align 8
  %add = fadd double %20, %21
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %22 = load double, double* %arrayidx9, align 8
  %add10 = fadd double %add, %22
  %mul = fmul double %add10, 3.333300e-01
  %arrayidx12 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul, double* %arrayidx12, align 8
  %23 = load double, double* %arrayidx6, align 8
  %24 = load double, double* %arrayidx9, align 8
  %add.1 = fadd double %23, %24
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx9.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %25 = load double, double* %arrayidx9.1, align 8
  %add10.1 = fadd double %add.1, %25
  %mul.1 = fmul double %add10.1, 3.333300e-01
  %arrayidx12.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.1, double* %arrayidx12.1, align 8
  %cmp2.1 = icmp slt i64 %indvars.iv.next.1, 1999
  br i1 %cmp2.1, label %for.body3, label %vector.memcheck, !llvm.loop !9

vector.memcheck:                                  ; preds = %for.body3
  br i1 %found.conflict, label %for.body16.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %26 = shl i64 %index, 1
  %offset.idx = or i64 %26, 1
  %27 = getelementptr inbounds double, double* %B, i64 %26
  %28 = bitcast double* %27 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %28, align 8, !alias.scope !10
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec30 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %29 = fadd <2 x double> %strided.vec, %strided.vec30
  %30 = add nuw nsw i64 %offset.idx, 1
  %31 = getelementptr inbounds double, double* %B, i64 %30
  %32 = getelementptr double, double* %31, i64 -1
  %33 = bitcast double* %32 to <4 x double>*
  %wide.vec31 = load <4 x double>, <4 x double>* %33, align 8, !alias.scope !10
  %strided.vec33 = shufflevector <4 x double> %wide.vec31, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %34 = fadd <2 x double> %29, %strided.vec33
  %35 = fmul <2 x double> %34, <double 3.333300e-01, double 3.333300e-01>
  %36 = bitcast double* %31 to <4 x double>*
  %wide.vec34 = load <4 x double>, <4 x double>* %36, align 8, !alias.scope !10
  %strided.vec36 = shufflevector <4 x double> %wide.vec34, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %37 = fadd <4 x double> %wide.vec31, %wide.vec34
  %38 = shufflevector <4 x double> %37, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %39 = fadd <2 x double> %38, %strided.vec36
  %40 = fmul <2 x double> %39, <double 3.333300e-01, double 3.333300e-01>
  %41 = getelementptr inbounds double, double* %A, i64 %30
  %42 = getelementptr double, double* %41, i64 -1
  %43 = bitcast double* %42 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %35, <2 x double> %40, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %43, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %44 = icmp eq i64 %index.next, 998
  br i1 %44, label %for.body16.preheader.loopexit, label %vector.body, !llvm.loop !15

for.body16.preheader.loopexit:                    ; preds = %vector.body
  br label %for.body16.preheader

for.body16.preheader:                             ; preds = %for.body16.preheader.loopexit, %vector.memcheck
  %indvars.iv13.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %for.body16.preheader.loopexit ]
  br label %for.body16

for.body16:                                       ; preds = %for.body16.preheader, %for.body16
  %indvars.iv13 = phi i64 [ %indvars.iv.next14.1, %for.body16 ], [ %indvars.iv13.ph, %for.body16.preheader ]
  %45 = add nsw i64 %indvars.iv13, -1
  %arrayidx19 = getelementptr inbounds double, double* %B, i64 %45
  %46 = load double, double* %arrayidx19, align 8
  %arrayidx21 = getelementptr inbounds double, double* %B, i64 %indvars.iv13
  %47 = load double, double* %arrayidx21, align 8
  %add22 = fadd double %46, %47
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %arrayidx25 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next14
  %48 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add22, %48
  %mul27 = fmul double %add26, 3.333300e-01
  %arrayidx29 = getelementptr inbounds double, double* %A, i64 %indvars.iv13
  store double %mul27, double* %arrayidx29, align 8
  %49 = load double, double* %arrayidx21, align 8
  %50 = load double, double* %arrayidx25, align 8
  %add22.1 = fadd double %49, %50
  %indvars.iv.next14.1 = add nuw nsw i64 %indvars.iv13, 2
  %arrayidx25.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next14.1
  %51 = load double, double* %arrayidx25.1, align 8
  %add26.1 = fadd double %add22.1, %51
  %mul27.1 = fmul double %add26.1, 3.333300e-01
  %arrayidx29.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next14
  store double %mul27.1, double* %arrayidx29.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next14.1, 1999
  br i1 %exitcond.1, label %for.end32, label %for.body16, !llvm.loop !16

for.end32:                                        ; preds = %for.body16
  %inc34 = add nuw nsw i32 %inc3411, 1
  %exitcond = icmp eq i32 %inc34, 500
  br i1 %exitcond, label %for.end35, label %for.body

for.end35:                                        ; preds = %for.end32
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
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
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
