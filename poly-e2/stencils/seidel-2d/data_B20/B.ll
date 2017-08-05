; ModuleID = 'A.ll'
source_filename = "seidel-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_seidel_2d(i32 500, i32 2000, [2000 x double]* %arraydecay)
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
  tail call void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %n, [2000 x double]* %A) #0 {
entry:
  br i1 true, label %for.body.us.preheader, label %for.end11

for.body.us.preheader:                            ; preds = %entry
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond1.for.inc9_crit_edge.us, %for.body.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next8, %for.cond1.for.inc9_crit_edge.us ]
  br i1 true, label %for.body3.us.prol.loopexit.unr-lcssa, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body.us
  %0 = trunc i64 %indvars.iv7 to i32
  %conv.us.prol = sitofp i32 %0 to double
  %mul.us.prol = fmul double %conv.us.prol, 2.000000e+00
  %add5.us.prol = fadd double %mul.us.prol, 2.000000e+00
  %div.us.prol = fdiv double %add5.us.prol, 2.000000e+03
  %arrayidx8.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 0
  store double %div.us.prol, double* %arrayidx8.us.prol, align 8
  br label %for.body3.us.prol.loopexit.unr-lcssa

for.body3.us.prol.loopexit.unr-lcssa:             ; preds = %for.body.us, %for.body3.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol.preheader ], [ 0, %for.body.us ]
  br i1 false, label %for.cond1.for.inc9_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit.unr-lcssa
  %1 = trunc i64 %indvars.iv7 to i32
  %conv.us = sitofp i32 %1 to double
  %2 = insertelement <2 x double> undef, double %conv.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  %3 = sub nsw i64 1998, %indvars.iv.unr.ph
  %4 = and i64 %3, -2
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %5, %for.body3.us ], [ %indvars.iv.unr.ph, %for.body3.us.preheader ]
  %5 = add nuw nsw i64 %indvars.iv, 2
  %6 = trunc i64 %5 to i32
  %conv4.us = sitofp i32 %6 to double
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %7 = add nsw i64 %indvars.iv, 3
  %8 = trunc i64 %7 to i32
  %conv4.us.1 = sitofp i32 %8 to double
  %mul.us.v.i1.1 = insertelement <2 x double> undef, double %conv4.us, i32 0
  %mul.us.v.i1.2 = insertelement <2 x double> %mul.us.v.i1.1, double %conv4.us.1, i32 1
  %mul.us = fmul <2 x double> %mul.us.v.i0.2, %mul.us.v.i1.2
  %add5.us = fadd <2 x double> %mul.us, <double 2.000000e+00, double 2.000000e+00>
  %div.us = fdiv <2 x double> %add5.us, <double 2.000000e+03, double 2.000000e+03>
  %9 = bitcast double* %arrayidx8.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %9, align 8
  %exitcond.1 = icmp eq i64 %5, 2000
  br i1 %exitcond.1, label %for.cond1.for.inc9_crit_edge.us.loopexit, label %for.body3.us

for.cond1.for.inc9_crit_edge.us.loopexit:         ; preds = %for.body3.us
  %10 = or i64 %indvars.iv.unr.ph, 2
  %11 = add nsw i64 %10, %4
  br label %for.cond1.for.inc9_crit_edge.us

for.cond1.for.inc9_crit_edge.us:                  ; preds = %for.cond1.for.inc9_crit_edge.us.loopexit, %for.body3.us.prol.loopexit.unr-lcssa
  %wide.trip.count9.pre-phi = phi i64 [ 1, %for.body3.us.prol.loopexit.unr-lcssa ], [ %11, %for.cond1.for.inc9_crit_edge.us.loopexit ]
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, %wide.trip.count9.pre-phi
  br i1 %exitcond, label %for.end11.loopexit, label %for.body.us

for.end11.loopexit:                               ; preds = %for.cond1.for.inc9_crit_edge.us
  br label %for.end11

for.end11:                                        ; preds = %for.end11.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_seidel_2d(i32 %tsteps, i32 %n, [2000 x double]* %A) #0 {
entry:
  br i1 true, label %for.body.lr.ph, label %for.end71

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.inc69, %for.body.lr.ph
  %inc7017 = phi i32 [ 0, %for.body.lr.ph ], [ %inc70, %for.inc69 ]
  br i1 true, label %for.body4.us.preheader, label %for.inc69

for.body4.us.preheader:                           ; preds = %for.body
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.body4.us.preheader, %for.cond5.for.inc66_crit_edge.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.cond5.for.inc66_crit_edge.us ], [ 1, %for.body4.us.preheader ]
  %0 = add nsw i64 %indvars.iv24, -1
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %arrayidx29.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 0
  %.pre = load double, double* %arrayidx29.us.phi.trans.insert, align 8
  %arrayidx12.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %0, i64 0
  %.pre18 = load double, double* %arrayidx12.us.phi.trans.insert, align 8
  %arrayidx17.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %0, i64 1
  %.pre19 = load double, double* %arrayidx17.us.phi.trans.insert, align 8
  %arrayidx34.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 1
  %.pre20 = load double, double* %arrayidx34.us.phi.trans.insert, align 8
  %arrayidx47.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next25, i64 0
  %.pre21 = load double, double* %arrayidx47.us.phi.trans.insert, align 8
  %arrayidx53.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next25, i64 1
  %.pre22 = load double, double* %arrayidx53.us.phi.trans.insert, align 8
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.body8.us, %for.body4.us
  %indvars.iv = phi i64 [ 1, %for.body4.us ], [ %indvars.iv.next, %for.body8.us ]
  %1 = phi double [ %.pre22, %for.body4.us ], [ %9, %for.body8.us ]
  %2 = phi double [ %.pre21, %for.body4.us ], [ %1, %for.body8.us ]
  %3 = phi double [ %.pre20, %for.body4.us ], [ %8, %for.body8.us ]
  %4 = phi double [ %.pre19, %for.body4.us ], [ %7, %for.body8.us ]
  %5 = phi double [ %.pre18, %for.body4.us ], [ %4, %for.body8.us ]
  %6 = phi double [ %.pre, %for.body4.us ], [ %div.us, %for.body8.us ]
  %add.us = fadd double %5, %4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx23.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %0, i64 %indvars.iv.next
  %7 = load double, double* %arrayidx23.us, align 8
  %add24.us = fadd double %add.us, %7
  %add30.us = fadd double %add24.us, %6
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv
  %add35.us = fadd double %add30.us, %3
  %arrayidx40.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv.next
  %8 = load double, double* %arrayidx40.us, align 8
  %add41.us = fadd double %add35.us, %8
  %add48.us = fadd double %add41.us, %2
  %add54.us = fadd double %add48.us, %1
  %arrayidx60.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next25, i64 %indvars.iv.next
  %9 = load double, double* %arrayidx60.us, align 8
  %add61.us = fadd double %add54.us, %9
  %div.us = fdiv double %add61.us, 9.000000e+00
  store double %div.us, double* %arrayidx34.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1999
  br i1 %exitcond, label %for.cond5.for.inc66_crit_edge.us, label %for.body8.us

for.cond5.for.inc66_crit_edge.us:                 ; preds = %for.body8.us
  %exitcond28 = icmp eq i64 %indvars.iv.next25, 1999
  br i1 %exitcond28, label %for.inc69.loopexit, label %for.body4.us

for.inc69.loopexit:                               ; preds = %for.cond5.for.inc66_crit_edge.us
  br label %for.inc69

for.inc69:                                        ; preds = %for.inc69.loopexit, %for.body
  %inc70 = add nuw nsw i32 %inc7017, 1
  %exitcond29 = icmp eq i32 %inc70, 500
  br i1 %exitcond29, label %for.end71.loopexit, label %for.body

for.end71.loopexit:                               ; preds = %for.inc69
  br label %for.end71

for.end71:                                        ; preds = %for.end71.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, [2000 x double]* %A) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %for.body.us.preheader, label %for.end12

for.body.us.preheader:                            ; preds = %entry
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %for.body.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 2000, %indvars.iv8
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond12, label %for.end12.loopexit, label %for.body.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
