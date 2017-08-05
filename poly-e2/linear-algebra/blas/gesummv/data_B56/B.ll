; ModuleID = 'A.ll'
source_filename = "gesummv.c"
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
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %arraydecay = bitcast i8* %call to [1300 x double]*
  %arraydecay7 = bitcast i8* %call1 to [1300 x double]*
  %arraydecay8 = bitcast i8* %call4 to double*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay7, double* %arraydecay8)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  %arraydecay11 = bitcast i8* %call2 to double*
  %arraydecay13 = bitcast i8* %call6 to double*
  call fastcc void @kernel_gesummv(double %0, double %1, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay7, double* %arraydecay11, double* %arraydecay8, double* %arraydecay13)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call6 to double*
  call fastcc void @print_array(double* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call4) #4
  call void @free(i8* %call6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1300 x double]* nocapture %A, [1300 x double]* nocapture %B, double* nocapture %x) unnamed_addr #2 {
for.body.lr.ph.for.body.us_crit_edge:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.end_crit_edge.us, %for.body.lr.ph.for.body.us_crit_edge
  %indvars.iv49.us = phi i64 [ 0, %for.body.lr.ph.for.body.us_crit_edge ], [ %indvars.iv.next5.us, %for.cond2.for.end_crit_edge.us ]
  %0 = trunc i64 %indvars.iv49.us to i32
  %rem.us = srem i32 %0, 1300
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.300000e+03
  %arrayidx.us = getelementptr inbounds double, double* %x, i64 %indvars.iv49.us
  store double %div.us, double* %arrayidx.us, align 8
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.body5.us, %for.body.us
  %indvars.iv7.us = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next.us, %for.body5.us ]
  %1 = mul nuw nsw i64 %indvars.iv7.us, %indvars.iv49.us
  %2 = add nuw nsw i64 %1, 1
  %3 = trunc i64 %2 to i32
  %rem6.us = srem i32 %3, 1300
  %conv7.us = sitofp i32 %rem6.us to double
  %arrayidx13.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv49.us, i64 %indvars.iv7.us
  %4 = add nuw nsw i64 %1, 2
  %5 = trunc i64 %4 to i32
  %rem16.us = srem i32 %5, 1300
  %conv17.us = sitofp i32 %rem16.us to double
  %div9.v.i0.1.us = insertelement <2 x double> undef, double %conv7.us, i32 0
  %div9.v.i0.2.us = insertelement <2 x double> %div9.v.i0.1.us, double %conv17.us, i32 1
  %div9.us = fdiv <2 x double> %div9.v.i0.2.us, <double 1.300000e+03, double 1.300000e+03>
  %div9.v.r1.us = extractelement <2 x double> %div9.us, i32 0
  %div9.v.r2.us = extractelement <2 x double> %div9.us, i32 1
  store double %div9.v.r1.us, double* %arrayidx13.us, align 8
  %arrayidx23.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv49.us, i64 %indvars.iv7.us
  store double %div9.v.r2.us, double* %arrayidx23.us, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv7.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1300
  br i1 %exitcond.us, label %for.cond2.for.end_crit_edge.us, label %for.body5.us

for.cond2.for.end_crit_edge.us:                   ; preds = %for.body5.us
  %indvars.iv.next5.us = add nuw nsw i64 %indvars.iv49.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next5.us, 1300
  br i1 %cmp.us, label %for.body.us, label %for.end26

for.end26:                                        ; preds = %for.cond2.for.end_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gesummv(double %alpha, double %beta, [1300 x double]* nocapture readonly %A, [1300 x double]* nocapture readonly %B, double* %tmp, double* nocapture readonly %x, double* %y) unnamed_addr #2 {
for.body.lr.ph.for.body.us_crit_edge:
  %0 = ptrtoint double* %tmp to i64
  %sunkaddr = ptrtoint double* %tmp to i64
  %sunkaddr4 = ptrtoint double* %y to i64
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond5.for.end_crit_edge.us, %for.body.lr.ph.for.body.us_crit_edge
  %indvars.iv16.us = phi i64 [ 0, %for.body.lr.ph.for.body.us_crit_edge ], [ %indvars.iv.next2.us, %for.cond5.for.end_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv16.us
  store double 0.000000e+00, double* %arrayidx.us, align 8
  %arrayidx4.us = getelementptr inbounds double, double* %y, i64 %indvars.iv16.us
  store double 0.000000e+00, double* %arrayidx4.us, align 8
  %sunkaddr1 = shl i64 %indvars.iv16.us, 3
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to double*
  %sunkaddr5 = shl i64 %indvars.iv16.us, 3
  %sunkaddr6 = add i64 %sunkaddr4, %sunkaddr5
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to double*
  br label %for.body7.us

for.body7.us:                                     ; preds = %for.body7.us, %for.body.us
  %indvars.iv4.us = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next.us, %for.body7.us ]
  %arrayidx11.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv16.us, i64 %indvars.iv4.us
  %1 = load double, double* %arrayidx11.us, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %x, i64 %indvars.iv4.us
  %2 = load double, double* %arrayidx13.us, align 8
  %mul.us = fmul double %1, %2
  %3 = load double, double* %sunkaddr3, align 8
  %add.us = fadd double %mul.us, %3
  store double %add.us, double* %sunkaddr3, align 8
  %arrayidx21.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv16.us, i64 %indvars.iv4.us
  %4 = load double, double* %arrayidx21.us, align 8
  %arrayidx23.us = getelementptr inbounds double, double* %x, i64 %indvars.iv4.us
  %5 = load double, double* %arrayidx23.us, align 8
  %mul24.us = fmul double %4, %5
  %6 = load double, double* %sunkaddr7, align 8
  %add27.us = fadd double %mul24.us, %6
  store double %add27.us, double* %sunkaddr7, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv4.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1300
  br i1 %exitcond.us, label %for.cond5.for.end_crit_edge.us, label %for.body7.us

for.cond5.for.end_crit_edge.us:                   ; preds = %for.body7.us
  %sunkaddr17 = shl i64 %indvars.iv16.us, 3
  %sunkaddr18 = add i64 %0, %sunkaddr17
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to double*
  %7 = load double, double* %sunkaddr19, align 8
  %mul32.us = fmul double %7, %alpha
  %arrayidx34.us = getelementptr inbounds double, double* %y, i64 %indvars.iv16.us
  %8 = load double, double* %arrayidx34.us, align 8
  %mul35.us = fmul double %8, %beta
  %add36.us = fadd double %mul32.us, %mul35.us
  store double %add36.us, double* %arrayidx34.us, align 8
  %indvars.iv.next2.us = add nuw nsw i64 %indvars.iv16.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next2.us, 1300
  br i1 %cmp.us, label %for.body.us, label %for.end41

for.end41:                                        ; preds = %for.cond5.for.end_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %y) unnamed_addr #0 {
entry.for.body_crit_edge:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end, %entry.for.body_crit_edge
  %indvars.iv2 = phi i64 [ 0, %entry.for.body_crit_edge ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv2 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv2
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %cmp = icmp slt i64 %indvars.iv.next, 1300
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
