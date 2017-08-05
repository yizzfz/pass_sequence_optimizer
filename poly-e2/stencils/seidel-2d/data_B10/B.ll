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
  %1 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.cond1.preheader.lr.ph, label %for.end11

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv6 = sitofp i32 %n to double
  %0 = add i32 %n, -1
  %1 = sext i32 %n to i64
  %wide.trip.count = zext i32 %0 to i64
  %2 = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %2, 0
  %3 = icmp eq i32 %0, 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc9_crit_edge.us, %for.cond1.preheader.lr.ph
  %indvars.iv6 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next7, %for.cond1.for.inc9_crit_edge.us ]
  %4 = trunc i64 %indvars.iv6 to i32
  %conv.us = sitofp i32 %4 to double
  br i1 %lcmp.mod, label %for.body3.us.prol, label %for.body3.us.prol.loopexit

for.body3.us.prol:                                ; preds = %for.cond1.preheader.us
  %mul.us.prol = fmul double %conv.us, 2.000000e+00
  %add5.us.prol = fadd double %mul.us.prol, 2.000000e+00
  %div.us.prol = fdiv double %add5.us.prol, %conv6
  %arrayidx8.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 0
  store double %div.us.prol, double* %arrayidx8.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.cond1.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.cond1.preheader.us ]
  br i1 %3, label %for.cond1.for.inc9_crit_edge.us, label %for.cond1.preheader.us.new

for.cond1.preheader.us.new:                       ; preds = %for.body3.us.prol.loopexit
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.cond1.preheader.us.new ], [ %indvars.iv.next.1, %for.body3.us ]
  %5 = add nuw nsw i64 %indvars.iv, 2
  %6 = trunc i64 %5 to i32
  %conv4.us = sitofp i32 %6 to double
  %mul.us = fmul double %conv.us, %conv4.us
  %add5.us = fadd double %mul.us, 2.000000e+00
  %div.us = fdiv double %add5.us, %conv6
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv
  store double %div.us, double* %arrayidx8.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = add nsw i64 %indvars.iv, 3
  %8 = trunc i64 %7 to i32
  %conv4.us.1 = sitofp i32 %8 to double
  %mul.us.1 = fmul double %conv.us, %conv4.us.1
  %add5.us.1 = fadd double %mul.us.1, 2.000000e+00
  %div.us.1 = fdiv double %add5.us.1, %conv6
  %arrayidx8.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %div.us.1, double* %arrayidx8.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond1.for.inc9_crit_edge.us.loopexit, label %for.body3.us

for.cond1.for.inc9_crit_edge.us.loopexit:         ; preds = %for.body3.us
  br label %for.cond1.for.inc9_crit_edge.us

for.cond1.for.inc9_crit_edge.us:                  ; preds = %for.cond1.for.inc9_crit_edge.us.loopexit, %for.body3.us.prol.loopexit
  %indvars.iv.next7 = add nuw i64 %indvars.iv6, 1
  %cmp.us = icmp slt i64 %indvars.iv.next7, %1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end11.loopexit

for.end11.loopexit:                               ; preds = %for.cond1.for.inc9_crit_edge.us
  br label %for.end11

for.end11:                                        ; preds = %for.end11.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d(i32 %tsteps, i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  %cmp5 = icmp sgt i32 %tsteps, 0
  br i1 %cmp5, label %for.cond1.preheader.lr.ph, label %for.end71

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub2 = add nsw i32 %n, -2
  %0 = sext i32 %sub2 to i64
  %wide.trip.count = zext i32 %sub2 to i64
  %1 = icmp slt i32 %sub2, 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc69, %for.cond1.preheader.lr.ph
  %t.06 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc70, %for.inc69 ]
  br i1 %1, label %for.inc69, label %for.cond5.preheader.preheader

for.cond5.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond5.preheader.preheader, %for.inc66
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.inc66 ], [ 1, %for.cond5.preheader.preheader ]
  %2 = add nsw i64 %indvars.iv8, -1
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %arrayidx12.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %2, i64 0
  %.pre = load double, double* %arrayidx12.phi.trans.insert, align 8
  %arrayidx17.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %2, i64 1
  %.pre11 = load double, double* %arrayidx17.phi.trans.insert, align 8
  %arrayidx29.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 0
  %.pre12 = load double, double* %arrayidx29.phi.trans.insert, align 8
  %arrayidx34.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 1
  %.pre13 = load double, double* %arrayidx34.phi.trans.insert, align 8
  %arrayidx47.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next9, i64 0
  %.pre14 = load double, double* %arrayidx47.phi.trans.insert, align 8
  %arrayidx53.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next9, i64 1
  %.pre15 = load double, double* %arrayidx53.phi.trans.insert, align 8
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.cond5.preheader
  %3 = phi double [ %.pre15, %for.cond5.preheader ], [ %11, %for.body8 ]
  %4 = phi double [ %.pre14, %for.cond5.preheader ], [ %3, %for.body8 ]
  %5 = phi double [ %.pre13, %for.cond5.preheader ], [ %10, %for.body8 ]
  %6 = phi double [ %.pre12, %for.cond5.preheader ], [ %div, %for.body8 ]
  %7 = phi double [ %.pre11, %for.cond5.preheader ], [ %9, %for.body8 ]
  %8 = phi double [ %.pre, %for.cond5.preheader ], [ %7, %for.body8 ]
  %indvars.iv = phi i64 [ 1, %for.cond5.preheader ], [ %indvars.iv.next, %for.body8 ]
  %add = fadd double %8, %7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx23 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %2, i64 %indvars.iv.next
  %9 = load double, double* %arrayidx23, align 8
  %add24 = fadd double %add, %9
  %add30 = fadd double %add24, %6
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %add35 = fadd double %add30, %5
  %arrayidx40 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv.next
  %10 = load double, double* %arrayidx40, align 8
  %add41 = fadd double %add35, %10
  %add48 = fadd double %add41, %4
  %add54 = fadd double %add48, %3
  %arrayidx60 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next9, i64 %indvars.iv.next
  %11 = load double, double* %arrayidx60, align 8
  %add61 = fadd double %add54, %11
  %div = fdiv double %add61, 9.000000e+00
  store double %div, double* %arrayidx34, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %for.inc66, label %for.body8

for.inc66:                                        ; preds = %for.body8
  %cmp3 = icmp slt i64 %indvars.iv8, %0
  br i1 %cmp3, label %for.cond5.preheader, label %for.inc69.loopexit

for.inc69.loopexit:                               ; preds = %for.inc66
  br label %for.inc69

for.inc69:                                        ; preds = %for.inc69.loopexit, %for.cond1.preheader
  %inc70 = add nuw nsw i32 %t.06, 1
  %cmp = icmp slt i32 %inc70, %tsteps
  br i1 %cmp, label %for.cond1.preheader, label %for.end71.loopexit

for.end71.loopexit:                               ; preds = %for.inc69
  br label %for.end71

for.end71:                                        ; preds = %for.end71.loopexit, %entry
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
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv7, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next8 = add nuw i64 %indvars.iv7, 1
  %cmp.us = icmp slt i64 %indvars.iv.next8, %3
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
