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
  %1 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(double* %1)
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

for.cond7.preheader.us:                           ; preds = %for.cond7.preheader.us.preheader, %for.cond7.for.inc22_crit_edge.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %for.cond7.for.inc22_crit_edge.us ], [ 0, %for.cond7.preheader.us.preheader ]
  br label %for.body10.us

for.body10.us:                                    ; preds = %for.body10.us.for.body10.us_crit_edge, %for.cond7.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body10.us.for.body10.us_crit_edge ], [ 0, %for.cond7.preheader.us ]
  %0 = add nsw i64 %indvars.iv13, %indvars.iv
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 2100
  %conv12.us = sitofp i32 %rem.us to double
  %div14.us = fdiv double %conv12.us, 9.500000e+03
  %arrayidx18.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv13, i64 %indvars.iv
  store double %div14.us, double* %arrayidx18.us, align 8
  %exitcond16 = icmp eq i64 %indvars.iv, 2099
  br i1 %exitcond16, label %for.cond7.for.inc22_crit_edge.us, label %for.body10.us.for.body10.us_crit_edge

for.body10.us.for.body10.us_crit_edge:            ; preds = %for.body10.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body10.us

for.cond7.for.inc22_crit_edge.us:                 ; preds = %for.body10.us
  %indvars.iv.next14 = add i64 %indvars.iv13, 1
  %cmp4.us = icmp slt i64 %indvars.iv.next14, 1900
  br i1 %cmp4.us, label %for.cond7.preheader.us, label %for.end24

for.body:                                         ; preds = %for.body.for.body_crit_edge, %entry
  %indvars.iv17 = phi i64 [ 0, %entry ], [ %indvars.iv.next18, %for.body.for.body_crit_edge ]
  %2 = trunc i64 %indvars.iv17 to i32
  %conv2 = sitofp i32 %2 to double
  %div = fdiv double %conv2, 2.100000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv17
  store double %add, double* %arrayidx, align 8
  %exitcond = icmp eq i64 %indvars.iv17, 2099
  br i1 %exitcond, label %for.cond7.preheader.us.preheader, label %for.body.for.body_crit_edge

for.cond7.preheader.us.preheader:                 ; preds = %for.body
  br label %for.cond7.preheader.us

for.body.for.body_crit_edge:                      ; preds = %for.body
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  br label %for.body

for.end24:                                        ; preds = %for.cond7.for.inc22_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_atax([2100 x double]* nocapture readonly %A, double* nocapture readonly %x, double* nocapture %y, double* %tmp) unnamed_addr #0 {
entry:
  %0 = bitcast double* %y to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 16800, i32 8, i1 false)
  br label %for.body

for.body5.us:                                     ; preds = %for.body5.us.preheader, %for.inc42.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.inc42.us ], [ 0, %for.body5.us.preheader ]
  %sext = shl i64 %indvars.iv62, 32
  %idxprom6.us = ashr exact i64 %sext, 32
  %arrayidx7.us = getelementptr inbounds double, double* %tmp, i64 %idxprom6.us
  store double 0.000000e+00, double* %arrayidx7.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv62
  %.pre = load double, double* %arrayidx12.us, align 8
  %sunkaddr9 = shl i64 %indvars.iv62, 3
  %sunkaddr10 = add i64 %sunkaddr8, %sunkaddr9
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to double*
  br label %for.body10.us

for.inc42.us:                                     ; preds = %for.body26.us.for.body26.us_crit_edge
  %indvars.iv.next63 = add i64 %indvars.iv62, 1
  %cmp4.us = icmp slt i64 %indvars.iv.next63, 1900
  br i1 %cmp4.us, label %for.body5.us, label %for.end44

for.body26.us.for.body26.us_crit_edge:            ; preds = %for.body26.us.for.body26.us_crit_edge.1, %for.body26.us.preheader
  %indvars.iv604 = phi i64 [ 0, %for.body26.us.preheader ], [ %indvars.iv.next61.1, %for.body26.us.for.body26.us_crit_edge.1 ]
  %indvars.iv.next61 = or i64 %indvars.iv604, 1
  %.pre70 = load double, double* %sunkaddr14, align 8
  %arrayidx28.us = getelementptr inbounds double, double* %y, i64 %indvars.iv.next61
  %1 = load double, double* %arrayidx28.us, align 8
  %arrayidx32.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv62, i64 %indvars.iv.next61
  %2 = load double, double* %arrayidx32.us, align 8
  %mul35.us = fmul double %2, %.pre70
  %add36.us = fadd double %1, %mul35.us
  store double %add36.us, double* %arrayidx28.us, align 8
  %exitcond71 = icmp eq i64 %indvars.iv.next61, 2099
  br i1 %exitcond71, label %for.inc42.us, label %for.body26.us.for.body26.us_crit_edge.1

for.body10.us:                                    ; preds = %for.body10.us.for.body10.us_crit_edge, %for.body5.us
  %3 = phi double [ %.pre, %for.body5.us ], [ %add.us, %for.body10.us.for.body10.us_crit_edge ]
  %indvars.iv = phi i64 [ 0, %for.body5.us ], [ %indvars.iv.next, %for.body10.us.for.body10.us_crit_edge ]
  %arrayidx16.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv62, i64 %indvars.iv
  %4 = load double, double* %arrayidx16.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %5 = load double, double* %arrayidx18.us, align 8
  %mul.us = fmul double %4, %5
  %add.us = fadd double %3, %mul.us
  store double %add.us, double* %sunkaddr11, align 8
  %exitcond = icmp eq i64 %indvars.iv, 2099
  br i1 %exitcond, label %for.body26.us.preheader, label %for.body10.us.for.body10.us_crit_edge

for.body10.us.for.body10.us_crit_edge:            ; preds = %for.body10.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body10.us

for.body26.us.preheader:                          ; preds = %for.body10.us
  %6 = load double, double* %y, align 8
  %arrayidx32.us1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv62, i64 0
  %7 = load double, double* %arrayidx32.us1, align 8
  %mul35.us2 = fmul double %7, %add.us
  %add36.us3 = fadd double %6, %mul35.us2
  store double %add36.us3, double* %y, align 8
  %sunkaddr12 = mul i64 %indvars.iv62, 8
  %sunkaddr13 = add i64 %sunkaddr, %sunkaddr12
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to double*
  %sunkaddr16 = mul i64 %indvars.iv62, 8
  %sunkaddr17 = add i64 %sunkaddr15, %sunkaddr16
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to double*
  br label %for.body26.us.for.body26.us_crit_edge

for.body:                                         ; preds = %for.body.for.body_crit_edge, %entry
  %indvars.iv68 = phi i64 [ 0, %entry ], [ %indvars.iv.next69, %for.body.for.body_crit_edge ]
  %exitcond75 = icmp eq i64 %indvars.iv68, 2099
  br i1 %exitcond75, label %for.body5.us.preheader, label %for.body.for.body_crit_edge

for.body5.us.preheader:                           ; preds = %for.body
  %sunkaddr8 = ptrtoint double* %tmp to i64
  %sunkaddr = ptrtoint double* %tmp to i64
  %sunkaddr15 = ptrtoint double* %tmp to i64
  br label %for.body5.us

for.body.for.body_crit_edge:                      ; preds = %for.body
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  br label %for.body

for.end44:                                        ; preds = %for.inc42.us
  ret void

for.body26.us.for.body26.us_crit_edge.1:          ; preds = %for.body26.us.for.body26.us_crit_edge
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv604, 2
  %.pre70.1 = load double, double* %sunkaddr18, align 8
  %arrayidx28.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next61.1
  %8 = load double, double* %arrayidx28.us.1, align 8
  %arrayidx32.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv62, i64 %indvars.iv.next61.1
  %9 = load double, double* %arrayidx32.us.1, align 8
  %mul35.us.1 = fmul double %9, %.pre70.1
  %add36.us.1 = fadd double %8, %mul35.us.1
  store double %add36.us.1, double* %arrayidx28.us.1, align 8
  br label %for.body26.us.for.body26.us_crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end.for.body_crit_edge, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.for.body_crit_edge ], [ 0, %entry ]
  %storemerge2 = phi i32 [ %6, %if.end.for.body_crit_edge ], [ 0, %entry ]
  %rem = srem i32 %storemerge2, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %3) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %5 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %5) #7
  %indvars.iv.next = add i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, 2100
  br i1 %cmp, label %if.end.for.body_crit_edge, label %for.end

if.end.for.body_crit_edge:                        ; preds = %if.end
  %6 = trunc i64 %indvars.iv.next to i32
  br label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
