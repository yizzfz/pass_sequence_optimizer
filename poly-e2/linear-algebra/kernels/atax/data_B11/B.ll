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
  %call = call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call2 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %arraydecay = bitcast i8* %call to [2100 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  call fastcc void @init_array(i32 1900, i32 2100, [2100 x double]* %arraydecay, double* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %arraydecay7 = bitcast i8* %call2 to double*
  %arraydecay8 = bitcast i8* %call3 to double*
  call fastcc void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay7, double* %arraydecay8)
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
  %1 = bitcast i8* %call2 to double*
  call fastcc void @print_array(i32 2100, double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [2100 x double]* nocapture %A, double* nocapture %x) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %inc12 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %conv2 = sitofp i32 %inc12 to double
  %div = fdiv double %conv2, 2.100000e+03
  %add = fadd double %div, 1.000000e+00
  %idxprom = sext i32 %inc12 to i64
  %arrayidx = getelementptr inbounds double, double* %x, i64 %idxprom
  store double %add, double* %arrayidx, align 8
  %inc = add nsw i32 %inc12, 1
  %cmp = icmp slt i32 %inc, 2100
  br i1 %cmp, label %for.body, label %for.body.for.body6.us_crit_edge

for.body.for.body6.us_crit_edge:                  ; preds = %for.body
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.cond7.for.inc22_crit_edge.us, %for.body.for.body6.us_crit_edge
  %indvars.iv16 = phi i64 [ 0, %for.body.for.body6.us_crit_edge ], [ %indvars.iv.next17, %for.cond7.for.inc22_crit_edge.us ]
  br label %for.body10.us

for.body10.us:                                    ; preds = %for.body10.us, %for.body6.us
  %indvars.iv = phi i64 [ 0, %for.body6.us ], [ %indvars.iv.next, %for.body10.us ]
  %0 = add nsw i64 %indvars.iv16, %indvars.iv
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 2100
  %conv12.us = sitofp i32 %rem.us to double
  %div14.us = fdiv double %conv12.us, 9.500000e+03
  %arrayidx18.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv
  store double %div14.us, double* %arrayidx18.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %for.cond7.for.inc22_crit_edge.us, label %for.body10.us

for.cond7.for.inc22_crit_edge.us:                 ; preds = %for.body10.us
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, 1
  %cmp4.us = icmp slt i64 %indvars.iv.next17, 1900
  br i1 %cmp4.us, label %for.body6.us, label %for.end24

for.end24:                                        ; preds = %for.cond7.for.inc22_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax(i32 %m, i32 %n, [2100 x double]* nocapture readonly %A, double* nocapture readonly %x, double* nocapture %y, double* nocapture %tmp) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %inc19 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %idxprom = sext i32 %inc19 to i64
  %arrayidx = getelementptr inbounds double, double* %y, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8
  %inc = add nsw i32 %inc19, 1
  %cmp = icmp slt i32 %inc, 2100
  br i1 %cmp, label %for.body, label %for.body.for.body5.us_crit_edge

for.body.for.body5.us_crit_edge:                  ; preds = %for.body
  %sunkaddr80 = ptrtoint double* %tmp to i64
  %sunkaddr = ptrtoint double* %tmp to i64
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.inc42.us, %for.body.for.body5.us_crit_edge
  %indvars.iv65 = phi i64 [ 0, %for.body.for.body5.us_crit_edge ], [ %indvars.iv.next66, %for.inc42.us ]
  %sext = shl i64 %indvars.iv65, 32
  %idxprom6.us = ashr exact i64 %sext, 32
  %arrayidx7.us = getelementptr inbounds double, double* %tmp, i64 %idxprom6.us
  store double 0.000000e+00, double* %arrayidx7.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv65
  %.pre = load double, double* %arrayidx12.us, align 8
  %sunkaddr81 = mul i64 %indvars.iv65, 8
  %sunkaddr82 = add i64 %sunkaddr80, %sunkaddr81
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to double*
  br label %for.body10.us

for.inc42.us:                                     ; preds = %for.body26.us.for.body26.us_crit_edge
  %indvars.iv.next66 = add nsw i64 %indvars.iv65, 1
  %cmp4.us = icmp slt i64 %indvars.iv.next66, 1900
  br i1 %cmp4.us, label %for.body5.us, label %for.end44

for.body26.us.for.body26.us_crit_edge:            ; preds = %for.body26.us.for.body26.us_crit_edge, %for.body26.us.preheader
  %indvars.iv.next6476 = phi i64 [ 1, %for.body26.us.preheader ], [ %indvars.iv.next64, %for.body26.us.for.body26.us_crit_edge ]
  %.pre71 = load double, double* %sunkaddr79, align 8
  %arrayidx28.us = getelementptr inbounds double, double* %y, i64 %indvars.iv.next6476
  %0 = load double, double* %arrayidx28.us, align 8
  %arrayidx32.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv.next6476
  %1 = load double, double* %arrayidx32.us, align 8
  %mul35.us = fmul double %1, %.pre71
  %add36.us = fadd double %0, %mul35.us
  store double %add36.us, double* %arrayidx28.us, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv.next6476, 1
  %cmp25.us = icmp slt i64 %indvars.iv.next64, 2100
  br i1 %cmp25.us, label %for.body26.us.for.body26.us_crit_edge, label %for.inc42.us

for.body10.us:                                    ; preds = %for.body10.us, %for.body5.us
  %2 = phi double [ %.pre, %for.body5.us ], [ %add.us, %for.body10.us ]
  %indvars.iv = phi i64 [ 0, %for.body5.us ], [ %indvars.iv.next, %for.body10.us ]
  %arrayidx16.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv
  %3 = load double, double* %arrayidx16.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %4 = load double, double* %arrayidx18.us, align 8
  %mul.us = fmul double %3, %4
  %add.us = fadd double %2, %mul.us
  store double %add.us, double* %sunkaddr83, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp9.us = icmp slt i64 %indvars.iv.next, 2100
  br i1 %cmp9.us, label %for.body10.us, label %for.body26.us.preheader

for.body26.us.preheader:                          ; preds = %for.body10.us
  %5 = load double, double* %y, align 8
  %arrayidx32.us73 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 0
  %6 = load double, double* %arrayidx32.us73, align 8
  %mul35.us74 = fmul double %6, %add.us
  %add36.us75 = fadd double %5, %mul35.us74
  store double %add36.us75, double* %y, align 8
  %sunkaddr77 = mul i64 %indvars.iv65, 8
  %sunkaddr78 = add i64 %sunkaddr, %sunkaddr77
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to double*
  br label %for.body26.us.for.body26.us_crit_edge

for.end44:                                        ; preds = %for.inc42.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end.for.body_crit_edge, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end.for.body_crit_edge ]
  %storemerge2 = phi i32 [ 0, %entry ], [ %6, %if.end.for.body_crit_edge ]
  %rem = srem i32 %storemerge2, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %3) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %5 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %5) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, 2100
  br i1 %cmp, label %if.end.for.body_crit_edge, label %for.end

if.end.for.body_crit_edge:                        ; preds = %if.end
  %6 = trunc i64 %indvars.iv.next to i32
  br label %for.body

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
