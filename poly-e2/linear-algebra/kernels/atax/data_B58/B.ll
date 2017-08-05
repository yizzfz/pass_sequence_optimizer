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
  call fastcc void @init_array([2100 x double]* %arraydecay, double* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %arraydecay7 = bitcast i8* %call2 to double*
  %arraydecay8 = bitcast i8* %call3 to double*
  call fastcc void @kernel_atax([2100 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay7, double* %arraydecay8)
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
  call fastcc void @print_array(double* %1)
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
define internal fastcc void @init_array([2100 x double]* nocapture %A, double* nocapture %x) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv17 = phi i64 [ 0, %entry ], [ %indvars.iv.next18.2, %for.body ]
  %0 = trunc i64 %indvars.iv17 to i32
  %conv2 = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv17
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %1 = trunc i64 %indvars.iv.next18 to i32
  %conv2.1 = sitofp i32 %1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv2, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv2.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.100000e+03, double 2.100000e+03>
  %add = fadd <2 x double> %div, <double 1.000000e+00, double 1.000000e+00>
  %2 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> %add, <2 x double>* %2, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %3 = trunc i64 %indvars.iv.next18.1 to i32
  %conv2.2 = sitofp i32 %3 to double
  %div.2 = fdiv double %conv2.2, 2.100000e+03
  %add.2 = fadd double %div.2, 1.000000e+00
  %arrayidx.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next18.1
  store double %add.2, double* %arrayidx.2, align 8
  %indvars.iv.next18.2 = add nsw i64 %indvars.iv17, 3
  %exitcond20.2 = icmp eq i64 %indvars.iv.next18.2, 2100
  br i1 %exitcond20.2, label %for.body6.us.preheader, label %for.body

for.body6.us.preheader:                           ; preds = %for.body
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us.preheader, %for.inc22.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.inc22.us ], [ 0, %for.body6.us.preheader ]
  br label %for.body10.us

for.body10.us:                                    ; preds = %for.body10.us, %for.body6.us
  %indvars.iv = phi i64 [ 0, %for.body6.us ], [ %indvars.iv.next.1, %for.body10.us ]
  %4 = add nsw i64 %indvars.iv15, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 2100
  %conv12.us = sitofp i32 %rem.us to double
  %arrayidx18.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %6 = add nsw i64 %indvars.iv15, %indvars.iv.next
  %7 = trunc i64 %6 to i32
  %rem.us.1 = srem i32 %7, 2100
  %conv12.us.1 = sitofp i32 %rem.us.1 to double
  %div14.us.v.i0.1 = insertelement <2 x double> undef, double %conv12.us, i32 0
  %div14.us.v.i0.2 = insertelement <2 x double> %div14.us.v.i0.1, double %conv12.us.1, i32 1
  %div14.us = fdiv <2 x double> %div14.us.v.i0.2, <double 9.500000e+03, double 9.500000e+03>
  %8 = bitcast double* %arrayidx18.us to <2 x double>*
  store <2 x double> %div14.us, <2 x double>* %8, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %for.inc22.us, label %for.body10.us

for.inc22.us:                                     ; preds = %for.body10.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, 1900
  br i1 %exitcond, label %for.end24, label %for.body6.us

for.end24:                                        ; preds = %for.inc22.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_atax([2100 x double]* nocapture readonly %A, double* nocapture readonly %x, double* nocapture %y, double* %tmp) unnamed_addr #0 {
entry:
  %scevgep8384 = bitcast double* %y to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8384, i8 0, i64 16800, i32 8, i1 false)
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv80 = phi i64 [ 0, %entry ], [ %indvars.iv.next81.24, %for.body ]
  %indvars.iv.next81.24 = add nsw i64 %indvars.iv80, 25
  %exitcond89.24 = icmp eq i64 %indvars.iv.next81.24, 2100
  br i1 %exitcond89.24, label %for.body5.us.preheader, label %for.body

for.body5.us.preheader:                           ; preds = %for.body
  %sunkaddr = ptrtoint double* %tmp to i64
  %sunkaddr13 = ptrtoint double* %tmp to i64
  %sunkaddr17 = ptrtoint double* %tmp to i64
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.body5.us.preheader, %for.inc42.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %for.inc42.us ], [ 0, %for.body5.us.preheader ]
  %arrayidx7.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv69
  store double 0.000000e+00, double* %arrayidx7.us, align 8
  %sunkaddr1 = shl i64 %indvars.iv69, 3
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to double*
  br label %for.body10.us

for.body10.us:                                    ; preds = %for.body10.us, %for.body5.us
  %0 = phi double [ 0.000000e+00, %for.body5.us ], [ %add.us.1, %for.body10.us ]
  %indvars.iv = phi i64 [ 0, %for.body5.us ], [ %indvars.iv.next.1, %for.body10.us ]
  %arrayidx16.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv
  %1 = load double, double* %arrayidx16.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %2 = load double, double* %arrayidx18.us, align 8
  %mul.us = fmul double %1, %2
  %add.us = fadd double %0, %mul.us
  store double %add.us, double* %sunkaddr3, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx16.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv.next
  %3 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx18.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %4 = load double, double* %arrayidx18.us.1, align 8
  %mul.us.1 = fmul double %3, %4
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %sunkaddr3, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %for.body26.us.preheader, label %for.body10.us

for.body26.us.preheader:                          ; preds = %for.body10.us
  %5 = load double, double* %y, align 8
  %arrayidx32.us8 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv69, i64 0
  %6 = load double, double* %arrayidx32.us8, align 8
  %mul35.us9 = fmul double %6, %add.us.1
  %add36.us10 = fadd double %5, %mul35.us9
  store double %add36.us10, double* %y, align 8
  %sunkaddr14 = shl i64 %indvars.iv69, 3
  %sunkaddr15 = add i64 %sunkaddr13, %sunkaddr14
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to double*
  %sunkaddr18 = shl i64 %indvars.iv69, 3
  %sunkaddr19 = add i64 %sunkaddr17, %sunkaddr18
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to double*
  br label %for.body26.us.for.body26.us_crit_edge

for.body26.us.for.body26.us_crit_edge:            ; preds = %for.body26.us.for.body26.us_crit_edge.1, %for.body26.us.preheader
  %indvars.iv6711 = phi i64 [ 0, %for.body26.us.preheader ], [ %indvars.iv.next68.1, %for.body26.us.for.body26.us_crit_edge.1 ]
  %indvars.iv.next68 = or i64 %indvars.iv6711, 1
  %.pre = load double, double* %sunkaddr16, align 8
  %arrayidx28.us = getelementptr inbounds double, double* %y, i64 %indvars.iv.next68
  %7 = load double, double* %arrayidx28.us, align 8
  %arrayidx32.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv.next68
  %8 = load double, double* %arrayidx32.us, align 8
  %mul35.us = fmul double %8, %.pre
  %add36.us = fadd double %7, %mul35.us
  store double %add36.us, double* %arrayidx28.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next68, 2099
  br i1 %exitcond, label %for.inc42.us, label %for.body26.us.for.body26.us_crit_edge.1

for.inc42.us:                                     ; preds = %for.body26.us.for.body26.us_crit_edge
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next70, 1900
  br i1 %exitcond87, label %for.end44, label %for.body5.us

for.end44:                                        ; preds = %for.inc42.us
  ret void

for.body26.us.for.body26.us_crit_edge.1:          ; preds = %for.body26.us.for.body26.us_crit_edge
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv6711, 2
  %.pre.1 = load double, double* %sunkaddr20, align 8
  %arrayidx28.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next68.1
  %9 = load double, double* %arrayidx28.us.1, align 8
  %arrayidx32.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv.next68.1
  %10 = load double, double* %arrayidx32.us.1, align 8
  %mul35.us.1 = fmul double %10, %.pre.1
  %add36.us.1 = fadd double %9, %mul35.us.1
  store double %add36.us.1, double* %arrayidx28.us.1, align 8
  br label %for.body26.us.for.body26.us_crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
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
