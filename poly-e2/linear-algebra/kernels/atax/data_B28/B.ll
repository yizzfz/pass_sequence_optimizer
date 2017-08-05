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

for.cond7.preheader.us:                           ; preds = %for.cond7.preheader.us.preheader, %for.cond7.for.inc22_crit_edge.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.cond7.for.inc22_crit_edge.us ], [ 0, %for.cond7.preheader.us.preheader ]
  br label %for.body10.us

for.body10.us:                                    ; preds = %for.body10.us, %for.cond7.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond7.preheader.us ], [ %indvars.iv.next.1, %for.body10.us ]
  %0 = add nuw nsw i64 %indvars.iv15, %indvars.iv
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 2100
  %conv12.us = sitofp i32 %rem.us to double
  %arrayidx18.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %2 = add nuw nsw i64 %indvars.iv15, %indvars.iv.next
  %3 = trunc i64 %2 to i32
  %rem.us.1 = srem i32 %3, 2100
  %conv12.us.1 = sitofp i32 %rem.us.1 to double
  %div14.us.v.i0.1 = insertelement <2 x double> undef, double %conv12.us, i32 0
  %div14.us.v.i0.2 = insertelement <2 x double> %div14.us.v.i0.1, double %conv12.us.1, i32 1
  %div14.us = fdiv <2 x double> %div14.us.v.i0.2, <double 9.500000e+03, double 9.500000e+03>
  %4 = bitcast double* %arrayidx18.us to <2 x double>*
  store <2 x double> %div14.us, <2 x double>* %4, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 2099
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond7.for.inc22_crit_edge.us, label %for.body10.us

for.cond7.for.inc22_crit_edge.us:                 ; preds = %for.body10.us
  %indvars.iv.next16 = add i64 %indvars.iv15, 1
  %cmp4.us = icmp slt i64 %indvars.iv.next16, 1900
  br i1 %cmp4.us, label %for.cond7.preheader.us, label %for.end24

for.body:                                         ; preds = %for.body, %entry
  %inc12 = phi i32 [ 0, %entry ], [ %inc.1, %for.body ]
  %conv2 = sitofp i32 %inc12 to double
  %idxprom = sext i32 %inc12 to i64
  %arrayidx = getelementptr inbounds double, double* %x, i64 %idxprom
  %inc = or i32 %inc12, 1
  %conv2.1 = sitofp i32 %inc to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv2, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv2.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.100000e+03, double 2.100000e+03>
  %add = fadd <2 x double> %div, <double 1.000000e+00, double 1.000000e+00>
  %5 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> %add, <2 x double>* %5, align 8
  %inc.1 = add nsw i32 %inc12, 2
  %cmp.1 = icmp slt i32 %inc.1, 2100
  br i1 %cmp.1, label %for.body, label %for.cond7.preheader.us.preheader

for.cond7.preheader.us.preheader:                 ; preds = %for.body
  br label %for.cond7.preheader.us

for.end24:                                        ; preds = %for.cond7.for.inc22_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax([2100 x double]* nocapture readonly %A, double* nocapture readonly %x, double* nocapture %y, double* %tmp) unnamed_addr #2 {
entry:
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i32 [ 0, %entry ], [ %index.next.4, %vector.body ]
  %0 = sext i32 %index to i64
  %1 = getelementptr inbounds double, double* %y, i64 %0
  %2 = bitcast double* %1 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %2, align 8
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %4, align 8
  %index.next = add nuw nsw i32 %index, 4
  %5 = sext i32 %index.next to i64
  %6 = getelementptr inbounds double, double* %y, i64 %5
  %7 = bitcast double* %6 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %index.next.1 = add nsw i32 %index, 8
  %10 = sext i32 %index.next.1 to i64
  %11 = getelementptr inbounds double, double* %y, i64 %10
  %12 = bitcast double* %11 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %12, align 8
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %14, align 8
  %index.next.2 = add nsw i32 %index, 12
  %15 = sext i32 %index.next.2 to i64
  %16 = getelementptr inbounds double, double* %y, i64 %15
  %17 = bitcast double* %16 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  %index.next.3 = add nsw i32 %index, 16
  %20 = sext i32 %index.next.3 to i64
  %21 = getelementptr inbounds double, double* %y, i64 %20
  %22 = bitcast double* %21 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %24, align 8
  %index.next.4 = add nsw i32 %index, 20
  %25 = icmp eq i32 %index.next.4, 2100
  br i1 %25, label %for.body5.us.preheader, label %vector.body, !llvm.loop !1

for.body5.us.preheader:                           ; preds = %vector.body
  %sunkaddr73 = ptrtoint double* %tmp to i64
  %sunkaddr = ptrtoint double* %tmp to i64
  %sunkaddr4 = ptrtoint double* %tmp to i64
  %sunkaddr8 = ptrtoint double* %y to i64
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.body5.us.preheader, %for.inc42.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc42.us ], [ 0, %for.body5.us.preheader ]
  %sext = shl i64 %indvars.iv63, 32
  %idxprom6.us = ashr exact i64 %sext, 32
  %arrayidx7.us = getelementptr inbounds double, double* %tmp, i64 %idxprom6.us
  store double 0.000000e+00, double* %arrayidx7.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv63
  %.pre = load double, double* %arrayidx12.us, align 8
  %sunkaddr74 = shl i64 %indvars.iv63, 3
  %sunkaddr75 = add i64 %sunkaddr73, %sunkaddr74
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to double*
  br label %for.body10.us

for.inc42.us:                                     ; preds = %for.body26.us.for.body26.us_crit_edge
  %indvars.iv.next64 = add i64 %indvars.iv63, 1
  %cmp4.us = icmp slt i64 %indvars.iv.next64, 1900
  br i1 %cmp4.us, label %for.body5.us, label %for.end44

for.body26.us.for.body26.us_crit_edge:            ; preds = %for.body26.us.for.body26.us_crit_edge.1, %for.body26.us.preheader
  %indvars.iv.next6280 = phi i64 [ 1, %for.body26.us.preheader ], [ %indvars.iv.next62.1, %for.body26.us.for.body26.us_crit_edge.1 ]
  %.pre69 = load double, double* %sunkaddr3, align 8
  %arrayidx28.us = getelementptr inbounds double, double* %y, i64 %indvars.iv.next6280
  %26 = load double, double* %arrayidx28.us, align 8
  %arrayidx32.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv63, i64 %indvars.iv.next6280
  %27 = load double, double* %arrayidx32.us, align 8
  %mul35.us = fmul double %27, %.pre69
  %add36.us = fadd double %26, %mul35.us
  store double %add36.us, double* %arrayidx28.us, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv.next6280, 1
  %cmp25.us = icmp slt i64 %indvars.iv.next62, 2100
  br i1 %cmp25.us, label %for.body26.us.for.body26.us_crit_edge.1, label %for.inc42.us

for.body10.us:                                    ; preds = %for.body10.us, %for.body5.us
  %28 = phi double [ %.pre, %for.body5.us ], [ %add.us.1, %for.body10.us ]
  %indvars.iv = phi i64 [ 0, %for.body5.us ], [ %indvars.iv.next.1, %for.body10.us ]
  %arrayidx16.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv63, i64 %indvars.iv
  %29 = load double, double* %arrayidx16.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %30 = load double, double* %arrayidx18.us, align 8
  %mul.us = fmul double %29, %30
  %add.us = fadd double %28, %mul.us
  store double %add.us, double* %sunkaddr76, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx16.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv63, i64 %indvars.iv.next
  %31 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx18.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %32 = load double, double* %arrayidx18.us.1, align 8
  %mul.us.1 = fmul double %31, %32
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %sunkaddr76, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %cmp9.us.1 = icmp slt i64 %indvars.iv.next.1, 2100
  br i1 %cmp9.us.1, label %for.body10.us, label %for.body26.us.preheader

for.body26.us.preheader:                          ; preds = %for.body10.us
  %33 = load double, double* %y, align 8
  %arrayidx32.us77 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv63, i64 0
  %34 = load double, double* %arrayidx32.us77, align 8
  %mul35.us78 = fmul double %34, %add.us.1
  %add36.us79 = fadd double %33, %mul35.us78
  store double %add36.us79, double* %y, align 8
  %sunkaddr1 = mul i64 %indvars.iv63, 8
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to double*
  %sunkaddr5 = mul i64 %indvars.iv63, 8
  %sunkaddr6 = add i64 %sunkaddr4, %sunkaddr5
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to double*
  br label %for.body26.us.for.body26.us_crit_edge

for.end44:                                        ; preds = %for.inc42.us
  ret void

for.body26.us.for.body26.us_crit_edge.1:          ; preds = %for.body26.us.for.body26.us_crit_edge
  %.pre69.1 = load double, double* %sunkaddr7, align 8
  %sunkaddr9 = mul i64 %indvars.iv.next6280, 8
  %sunkaddr10 = add i64 %sunkaddr8, %sunkaddr9
  %sunkaddr11 = add i64 %sunkaddr10, 8
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to double*
  %35 = load double, double* %sunkaddr12, align 8
  %arrayidx32.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv63, i64 %indvars.iv.next62
  %36 = load double, double* %arrayidx32.us.1, align 8
  %mul35.us.1 = fmul double %36, %.pre69.1
  %add36.us.1 = fadd double %35, %mul35.us.1
  store double %add36.us.1, double* %sunkaddr12, align 8
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv.next6280, 2
  br label %for.body26.us.for.body26.us_crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %y) unnamed_addr #0 {
for.body.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.body.lr.ph ]
  %storemerge2 = phi i32 [ %6, %if.end ], [ 0, %for.body.lr.ph ]
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
  %indvars.iv.next = add i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, 2100
  %6 = trunc i64 %indvars.iv.next to i32
  br i1 %cmp, label %for.body, label %for.end

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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
