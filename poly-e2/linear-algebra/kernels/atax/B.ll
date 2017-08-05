; ModuleID = 'A.ll'
source_filename = "atax.c"
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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %arraydecay = bitcast i8* %call to [2100 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  tail call fastcc void @init_array([2100 x double]* %arraydecay, double* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay7 = bitcast i8* %call2 to double*
  %arraydecay8 = bitcast i8* %call3 to double*
  tail call fastcc void @kernel_atax([2100 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay7, double* %arraydecay8)
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
  tail call fastcc void @print_array(double* %arraydecay7)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2100 x double]* nocapture %A, double* nocapture %x) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv20 = phi i64 [ 0, %entry ], [ %indvars.iv.next21.2, %for.body ]
  %0 = trunc i64 %indvars.iv20 to i32
  %conv2 = sitofp i32 %0 to double
  %div = fdiv double %conv2, 2.100000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv20
  store double %add, double* %arrayidx, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %1 = trunc i64 %indvars.iv.next21 to i32
  %conv2.1 = sitofp i32 %1 to double
  %div.1 = fdiv double %conv2.1, 2.100000e+03
  %add.1 = fadd double %div.1, 1.000000e+00
  %arrayidx.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next21
  store double %add.1, double* %arrayidx.1, align 8
  %indvars.iv.next21.1 = add nuw nsw i64 %indvars.iv20, 2
  %2 = trunc i64 %indvars.iv.next21.1 to i32
  %conv2.2 = sitofp i32 %2 to double
  %div.2 = fdiv double %conv2.2, 2.100000e+03
  %add.2 = fadd double %div.2, 1.000000e+00
  %arrayidx.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next21.1
  store double %add.2, double* %arrayidx.2, align 8
  %exitcond22.2 = icmp eq i64 %indvars.iv.next21.1, 2099
  %indvars.iv.next21.2 = add nuw nsw i64 %indvars.iv20, 3
  br i1 %exitcond22.2, label %for.cond7.preheader.preheader, label %for.body

for.cond7.preheader.preheader:                    ; preds = %for.body
  br label %for.cond7.preheader

for.cond7.preheader:                              ; preds = %for.cond7.preheader.preheader, %for.inc22
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %for.inc22 ], [ 0, %for.cond7.preheader.preheader ]
  br label %for.body10

for.body10:                                       ; preds = %for.body10, %for.cond7.preheader
  %indvars.iv = phi i64 [ 0, %for.cond7.preheader ], [ %indvars.iv.next.1, %for.body10 ]
  %3 = add nuw nsw i64 %indvars.iv, %indvars.iv18
  %4 = trunc i64 %3 to i32
  %rem = srem i32 %4, 2100
  %conv12 = sitofp i32 %rem to double
  %div14 = fdiv double %conv12, 9.500000e+03
  %arrayidx18 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv
  store double %div14, double* %arrayidx18, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %5 = add nuw nsw i64 %indvars.iv.next, %indvars.iv18
  %6 = trunc i64 %5 to i32
  %rem.1 = srem i32 %6, 2100
  %conv12.1 = sitofp i32 %rem.1 to double
  %div14.1 = fdiv double %conv12.1, 9.500000e+03
  %arrayidx18.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv.next
  store double %div14.1, double* %arrayidx18.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 2099
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc22, label %for.body10

for.inc22:                                        ; preds = %for.body10
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next19, 1900
  br i1 %exitcond1, label %for.end24, label %for.cond7.preheader

for.end24:                                        ; preds = %for.inc22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax([2100 x double]* nocapture readonly %A, double* nocapture readonly %x, double* nocapture %y, double* nocapture %tmp) unnamed_addr #2 {
for.body.for.body5_crit_edge:
  %y39 = bitcast double* %y to i8*
  call void @llvm.memset.p0i8.i64(i8* %y39, i8 0, i64 16800, i32 8, i1 false)
  br label %for.body5

for.body5:                                        ; preds = %for.inc42, %for.body.for.body5_crit_edge
  %indvars.iv34 = phi i64 [ 0, %for.body.for.body5_crit_edge ], [ %indvars.iv.next35, %for.inc42 ]
  %arrayidx7 = getelementptr inbounds double, double* %tmp, i64 %indvars.iv34
  store double 0.000000e+00, double* %arrayidx7, align 8
  br label %for.body10

for.body10:                                       ; preds = %for.body10, %for.body5
  %0 = phi double [ 0.000000e+00, %for.body5 ], [ %add.2, %for.body10 ]
  %indvars.iv = phi i64 [ 0, %for.body5 ], [ %indvars.iv.next.2, %for.body10 ]
  %arrayidx16 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv
  %1 = load double, double* %arrayidx16, align 8
  %arrayidx18 = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %2 = load double, double* %arrayidx18, align 8
  %mul = fmul double %1, %2
  %add = fadd double %0, %mul
  store double %add, double* %arrayidx7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx16.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv.next
  %3 = load double, double* %arrayidx16.1, align 8
  %arrayidx18.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %4 = load double, double* %arrayidx18.1, align 8
  %mul.1 = fmul double %3, %4
  %add.1 = fadd double %add, %mul.1
  store double %add.1, double* %arrayidx7, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx16.2 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv.next.1
  %5 = load double, double* %arrayidx16.2, align 8
  %arrayidx18.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next.1
  %6 = load double, double* %arrayidx18.2, align 8
  %mul.2 = fmul double %5, %6
  %add.2 = fadd double %add.1, %mul.2
  store double %add.2, double* %arrayidx7, align 8
  %exitcond.2 = icmp eq i64 %indvars.iv.next.1, 2099
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  br i1 %exitcond.2, label %for.body26.preheader, label %for.body10

for.body26.preheader:                             ; preds = %for.body10
  br label %for.body26

for.body26:                                       ; preds = %for.body26.preheader, %for.body26.for.body26_crit_edge
  %7 = phi double [ %.pre, %for.body26.for.body26_crit_edge ], [ %add.2, %for.body26.preheader ]
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.body26.for.body26_crit_edge ], [ 0, %for.body26.preheader ]
  %arrayidx28 = getelementptr inbounds double, double* %y, i64 %indvars.iv31
  %8 = load double, double* %arrayidx28, align 8
  %arrayidx32 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv31
  %9 = load double, double* %arrayidx32, align 8
  %mul35 = fmul double %9, %7
  %add36 = fadd double %8, %mul35
  store double %add36, double* %arrayidx28, align 8
  %exitcond33 = icmp eq i64 %indvars.iv31, 2099
  br i1 %exitcond33, label %for.inc42, label %for.body26.for.body26_crit_edge

for.body26.for.body26_crit_edge:                  ; preds = %for.body26
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %.pre = load double, double* %arrayidx7, align 8
  br label %for.body26

for.inc42:                                        ; preds = %for.body26
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next35, 1900
  br i1 %exitcond1, label %for.end44, label %for.body5

for.end44:                                        ; preds = %for.inc42
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
