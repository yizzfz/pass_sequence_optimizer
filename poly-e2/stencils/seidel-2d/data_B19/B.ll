; ModuleID = 'A.ll'
source_filename = "seidel-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_seidel_2d(i32 500, i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  %0 = sext i32 %n to i64
  %cmp6 = icmp sgt i32 %n, 0
  br i1 %cmp6, label %for.cond1.preheader.preheader, label %for.end11

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  %conv6 = sitofp i32 %n to double
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %1 = icmp eq i32 %n, 1
  %2 = insertelement <2 x double> undef, double %conv6, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc9, %for.cond1.preheader.preheader
  %indvars.iv27 = phi i64 [ %indvars.iv.next3, %for.inc9 ], [ 0, %for.cond1.preheader.preheader ]
  %3 = trunc i64 %indvars.iv27 to i32
  %conv = sitofp i32 %3 to double
  br i1 %lcmp.mod, label %for.body3.prol.loopexit, label %for.body3.prol

for.body3.prol:                                   ; preds = %for.cond1.preheader
  %mul.prol = fmul double %conv, 2.000000e+00
  %add5.prol = fadd double %mul.prol, 2.000000e+00
  %div.prol = fdiv double %add5.prol, %conv6
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 0
  store double %div.prol, double* %arrayidx8.prol, align 8
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol, %for.cond1.preheader
  %indvars.iv5.unr.ph = phi i64 [ 1, %for.body3.prol ], [ 0, %for.cond1.preheader ]
  br i1 %1, label %for.inc9, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  %4 = insertelement <2 x double> undef, double %conv, i32 0
  %mul.v.i0.2 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv5 = phi i64 [ %indvars.iv.next.1, %for.body3 ], [ %indvars.iv5.unr.ph, %for.body3.preheader ]
  %5 = add nuw nsw i64 %indvars.iv5, 2
  %6 = trunc i64 %5 to i32
  %conv4 = sitofp i32 %6 to double
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv5
  %7 = add nsw i64 %indvars.iv5, 3
  %8 = trunc i64 %7 to i32
  %conv4.1 = sitofp i32 %8 to double
  %mul.v.i1.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %conv4.1, i32 1
  %mul = fmul <2 x double> %mul.v.i0.2, %mul.v.i1.2
  %add5 = fadd <2 x double> %mul, <double 2.000000e+00, double 2.000000e+00>
  %div = fdiv <2 x double> %add5, %div.v.i1.2
  %9 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %div, <2 x double>* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv5, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.inc9.loopexit, label %for.body3

for.inc9.loopexit:                                ; preds = %for.body3
  br label %for.inc9

for.inc9:                                         ; preds = %for.inc9.loopexit, %for.body3.prol.loopexit
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, %0
  br i1 %exitcond, label %for.end11.loopexit, label %for.cond1.preheader

for.end11.loopexit:                               ; preds = %for.inc9
  br label %for.end11

for.end11:                                        ; preds = %for.end11.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d(i32 %tsteps, i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  %cmp17 = icmp sgt i32 %tsteps, 0
  br i1 %cmp17, label %for.cond1.preheader.lr.ph, label %for.end71

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = add i32 %n, -1
  %sub2 = add nsw i32 %n, -2
  %cmp314 = icmp slt i32 %sub2, 1
  %wide.trip.count = zext i32 %0 to i64
  %exitcond12 = icmp eq i32 %0, 1
  br i1 %cmp314, label %for.end71, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %1 = sext i32 %sub2 to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc69, %for.cond1.preheader.preheader
  %t.018 = phi i32 [ %inc70, %for.inc69 ], [ 0, %for.cond1.preheader.preheader ]
  br i1 %exitcond12, label %for.inc69, label %for.cond5.preheader.preheader

for.cond5.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond5.preheader.preheader, %for.inc66
  %indvar = phi i64 [ %indvar.next, %for.inc66 ], [ 0, %for.cond5.preheader.preheader ]
  %indvars.iv415 = phi i64 [ %indvars.iv.next5, %for.inc66 ], [ 1, %for.cond5.preheader.preheader ]
  %2 = add i64 %indvar, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %A, i64 %2, i64 0
  %3 = add nsw i64 %indvars.iv415, -1
  %4 = add nuw nsw i64 %indvars.iv415, 1
  %load_initial = load double, double* %scevgep, align 8
  br label %for.body8

for.body8:                                        ; preds = %for.cond5.preheader, %for.body8
  %store_forwarded = phi double [ %load_initial, %for.cond5.preheader ], [ %div, %for.body8 ]
  %indvars.iv13 = phi i64 [ 1, %for.cond5.preheader ], [ %indvars.iv.next, %for.body8 ]
  %5 = add nsw i64 %indvars.iv13, -1
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %3, i64 %5
  %6 = load double, double* %arrayidx12, align 8
  %arrayidx17 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %3, i64 %indvars.iv13
  %7 = load double, double* %arrayidx17, align 8
  %add = fadd double %6, %7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv13, 1
  %arrayidx23 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %3, i64 %indvars.iv.next
  %8 = load double, double* %arrayidx23, align 8
  %add24 = fadd double %add, %8
  %add30 = fadd double %add24, %store_forwarded
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv415, i64 %indvars.iv13
  %9 = load double, double* %arrayidx34, align 8
  %add35 = fadd double %add30, %9
  %arrayidx40 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv415, i64 %indvars.iv.next
  %10 = load double, double* %arrayidx40, align 8
  %add41 = fadd double %add35, %10
  %arrayidx47 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %4, i64 %5
  %11 = load double, double* %arrayidx47, align 8
  %add48 = fadd double %add41, %11
  %arrayidx53 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %4, i64 %indvars.iv13
  %12 = load double, double* %arrayidx53, align 8
  %add54 = fadd double %add48, %12
  %arrayidx60 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %4, i64 %indvars.iv.next
  %13 = load double, double* %arrayidx60, align 8
  %add61 = fadd double %add54, %13
  %div = fdiv double %add61, 9.000000e+00
  store double %div, double* %arrayidx34, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc66, label %for.body8

for.inc66:                                        ; preds = %for.body8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv415, 1
  %exitcond54 = icmp eq i64 %indvars.iv415, %1
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond54, label %for.inc69.loopexit, label %for.cond5.preheader

for.inc69.loopexit:                               ; preds = %for.inc66
  br label %for.inc69

for.inc69:                                        ; preds = %for.inc69.loopexit, %for.cond1.preheader
  %inc70 = add nuw nsw i32 %t.018, 1
  %exitcond56 = icmp eq i32 %inc70, %tsteps
  br i1 %exitcond56, label %for.end71.loopexit, label %for.cond1.preheader

for.end71.loopexit:                               ; preds = %for.inc69
  br label %for.end71

for.end71:                                        ; preds = %for.end71.loopexit, %for.cond1.preheader.lr.ph, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %3 = sext i32 %n to i64
  %cmp7 = icmp sgt i32 %n, 0
  br i1 %cmp7, label %for.cond2.preheader.preheader, label %for.end12

for.cond2.preheader.preheader:                    ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %for.cond2.preheader.preheader
  %indvars.iv28 = phi i64 [ %indvars.iv.next3, %for.inc10 ], [ 0, %for.cond2.preheader.preheader ]
  %4 = mul nsw i64 %indvars.iv28, %3
  br label %for.body4

for.body4:                                        ; preds = %for.cond2.preheader, %if.end
  %indvars.iv6 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %5 = add nsw i64 %indvars.iv6, %4
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv6
  %9 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next3, %3
  br i1 %exitcond11, label %for.end12.loopexit, label %for.cond2.preheader

for.end12.loopexit:                               ; preds = %for.inc10
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
