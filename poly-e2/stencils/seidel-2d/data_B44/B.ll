; ModuleID = 'A.ll'
source_filename = "seidel-2d.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_seidel_2d([2000 x double]* %arraydecay)
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
  tail call fastcc void @print_array([2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2000 x double]* %A) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc9_crit_edge.us, %entry
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.cond1.for.inc9_crit_edge.us ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv14 to i32
  %conv.us = sitofp i32 %0 to double
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.cond1.preheader.us, %for.inc.us
  %indvars.iv = phi i64 [ %1, %for.inc.us ], [ 0, %for.cond1.preheader.us ]
  %1 = add nsw i64 %indvars.iv, 2
  %2 = trunc i64 %1 to i32
  %conv4.us = sitofp i32 %2 to double
  %mul.us = fmul double %conv.us, %conv4.us
  %add5.us = fadd double %mul.us, 2.000000e+00
  %div.us = fdiv double %add5.us, 2.000000e+03
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv
  store double %div.us, double* %arrayidx8.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %3 = add nsw i64 %indvars.iv, 3
  %4 = trunc i64 %3 to i32
  %conv4.us.1 = sitofp i32 %4 to double
  %mul.us.1 = fmul double %conv.us, %conv4.us.1
  %add5.us.1 = fadd double %mul.us.1, 2.000000e+00
  %div.us.1 = fdiv double %add5.us.1, 2.000000e+03
  %arrayidx8.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv.next
  store double %div.us.1, double* %arrayidx8.us.1, align 8
  %exitcond.1 = icmp eq i64 %1, 2000
  br i1 %exitcond.1, label %for.cond1.for.inc9_crit_edge.us, label %for.inc.us

for.cond1.for.inc9_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, 2000
  br i1 %exitcond, label %for.end11, label %for.cond1.preheader.us

for.end11:                                        ; preds = %for.cond1.for.inc9_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d([2000 x double]* %A) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc69, %entry
  %storemerge39 = phi i32 [ 0, %entry ], [ %inc70, %for.inc69 ]
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond1.preheader, %for.inc66
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.inc66 ], [ 1, %for.cond1.preheader ]
  %0 = add nsw i64 %indvars.iv41, -1
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %arrayidx12.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %0, i64 0
  %.pre = load double, double* %arrayidx12.phi.trans.insert, align 8
  %arrayidx17.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %0, i64 1
  %.pre1 = load double, double* %arrayidx17.phi.trans.insert, align 8
  %arrayidx29.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 0
  %.pre2 = load double, double* %arrayidx29.phi.trans.insert, align 8
  %arrayidx34.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 1
  %.pre3 = load double, double* %arrayidx34.phi.trans.insert, align 8
  %arrayidx47.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next42, i64 0
  %.pre4 = load double, double* %arrayidx47.phi.trans.insert, align 8
  %arrayidx53.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next42, i64 1
  %.pre5 = load double, double* %arrayidx53.phi.trans.insert, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond5.preheader
  %1 = phi double [ %9, %for.inc ], [ %.pre5, %for.cond5.preheader ]
  %2 = phi double [ %1, %for.inc ], [ %.pre4, %for.cond5.preheader ]
  %3 = phi double [ %8, %for.inc ], [ %.pre3, %for.cond5.preheader ]
  %4 = phi double [ %div, %for.inc ], [ %.pre2, %for.cond5.preheader ]
  %5 = phi double [ %7, %for.inc ], [ %.pre1, %for.cond5.preheader ]
  %6 = phi double [ %5, %for.inc ], [ %.pre, %for.cond5.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 1, %for.cond5.preheader ]
  %add = fadd double %6, %5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx23 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %0, i64 %indvars.iv.next
  %7 = load double, double* %arrayidx23, align 8
  %add24 = fadd double %add, %7
  %add30 = fadd double %add24, %4
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv
  %add35 = fadd double %add30, %3
  %arrayidx40 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv.next
  %8 = load double, double* %arrayidx40, align 8
  %add41 = fadd double %add35, %8
  %add48 = fadd double %add41, %2
  %add54 = fadd double %add48, %1
  %arrayidx60 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next42, i64 %indvars.iv.next
  %9 = load double, double* %arrayidx60, align 8
  %add61 = fadd double %add54, %9
  %div = fdiv double %add61, 9.000000e+00
  store double %div, double* %arrayidx34, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1999
  br i1 %exitcond, label %for.inc66, label %for.inc

for.inc66:                                        ; preds = %for.inc
  %exitcond45 = icmp eq i64 %indvars.iv.next42, 1999
  br i1 %exitcond45, label %for.inc69, label %for.cond5.preheader

for.inc69:                                        ; preds = %for.inc66
  %inc70 = add nuw nsw i32 %storemerge39, 1
  %exitcond46 = icmp eq i32 %inc70, 500
  br i1 %exitcond46, label %for.end71, label %for.cond1.preheader

for.end71:                                        ; preds = %for.inc69
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv14 = phi i64 [ 0, %entry ], [ %indvars.iv.next15, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv14, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, 2000
  br i1 %exitcond18, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
