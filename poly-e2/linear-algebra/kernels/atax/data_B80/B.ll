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
for.body.lr.ph.new:
  br label %for.body

for.cond7.preheader.us.new:                       ; preds = %for.cond7.for.inc22_crit_edge.us, %for.cond7.preheader.us.new.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond7.preheader.us.new.preheader ], [ %indvars.iv.next17, %for.cond7.for.inc22_crit_edge.us ]
  br label %for.body10.us

for.body10.us:                                    ; preds = %for.body10.us, %for.cond7.preheader.us.new
  %indvars.iv = phi i64 [ 0, %for.cond7.preheader.us.new ], [ %indvars.iv.next.1, %for.body10.us ]
  %0 = add nsw i64 %indvars.iv16, %indvars.iv
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 2100
  %conv12.us = sitofp i32 %rem.us to double
  %arrayidx18.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %2 = add nsw i64 %indvars.iv16, %indvars.iv.next
  %3 = trunc i64 %2 to i32
  %rem.us.1 = srem i32 %3, 2100
  %conv12.us.1 = sitofp i32 %rem.us.1 to double
  %div14.us.v.i0.1 = insertelement <2 x double> undef, double %conv12.us, i32 0
  %div14.us.v.i0.2 = insertelement <2 x double> %div14.us.v.i0.1, double %conv12.us.1, i32 1
  %div14.us = fdiv <2 x double> %div14.us.v.i0.2, <double 9.500000e+03, double 9.500000e+03>
  %4 = bitcast double* %arrayidx18.us to <2 x double>*
  store <2 x double> %div14.us, <2 x double>* %4, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond19.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond19.1, label %for.cond7.for.inc22_crit_edge.us, label %for.body10.us

for.cond7.for.inc22_crit_edge.us:                 ; preds = %for.body10.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, 1900
  br i1 %exitcond, label %for.end24, label %for.cond7.preheader.us.new

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %indvars.iv21 = phi i64 [ 0, %for.body.lr.ph.new ], [ %indvars.iv.next22.1, %for.body ]
  %5 = trunc i64 %indvars.iv21 to i32
  %conv2 = sitofp i32 %5 to double
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv21
  %indvars.iv.next22 = or i64 %indvars.iv21, 1
  %6 = trunc i64 %indvars.iv.next22 to i32
  %conv2.1 = sitofp i32 %6 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv2, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv2.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.100000e+03, double 2.100000e+03>
  %add = fadd <2 x double> %div, <double 1.000000e+00, double 1.000000e+00>
  %7 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> %add, <2 x double>* %7, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %exitcond23.1 = icmp eq i64 %indvars.iv.next22.1, 2100
  br i1 %exitcond23.1, label %for.cond7.preheader.us.new.preheader, label %for.body

for.cond7.preheader.us.new.preheader:             ; preds = %for.body
  br label %for.cond7.preheader.us.new

for.end24:                                        ; preds = %for.cond7.for.inc22_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_atax(i32 %m, i32 %n, [2100 x double]* readonly %A, double* nocapture readonly %x, double* %y, double* %tmp) unnamed_addr #0 {
for.body5.us.preheader:
  %y92 = bitcast double* %y to i8*
  call void @llvm.memset.p0i8.i64(i8* %y92, i8 0, i64 16800, i32 8, i1 false)
  %scevgep = getelementptr double, double* %y, i64 1
  %scevgep98 = getelementptr double, double* %y, i64 2100
  br label %for.body5.us.new

for.body5.us.new:                                 ; preds = %for.inc42.us, %for.body5.us.preheader
  %indvars.iv74 = phi i64 [ 0, %for.body5.us.preheader ], [ %0, %for.inc42.us ]
  %scevgep100 = getelementptr [2100 x double], [2100 x double]* %A, i64 %indvars.iv74, i64 1
  %0 = add i64 %indvars.iv74, 1
  %scevgep102 = getelementptr [2100 x double], [2100 x double]* %A, i64 %0, i64 0
  %arrayidx7.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv74
  store double 0.000000e+00, double* %arrayidx7.us, align 8
  br label %for.body10.us

for.inc42.us:                                     ; preds = %for.body26.us.for.body26.us_crit_edge
  %exitcond76 = icmp eq i64 %0, 1900
  br i1 %exitcond76, label %for.end44, label %for.body5.us.new

for.body26.us.for.body26.us_crit_edge:            ; preds = %for.body26.us.for.body26.us_crit_edge, %for.body26.us.for.body26.us_crit_edge.preheader
  %indvars.iv6396 = phi i64 [ %indvars.iv6396.ph, %for.body26.us.for.body26.us_crit_edge.preheader ], [ %indvars.iv.next64, %for.body26.us.for.body26.us_crit_edge ]
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv6396, 1
  %.pre71 = load double, double* %arrayidx7.us, align 8
  %arrayidx28.us = getelementptr inbounds double, double* %y, i64 %indvars.iv.next64
  %1 = load double, double* %arrayidx28.us, align 8
  %arrayidx32.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv74, i64 %indvars.iv.next64
  %2 = load double, double* %arrayidx32.us, align 8
  %mul35.us = fmul double %2, %.pre71
  %add36.us = fadd double %1, %mul35.us
  store double %add36.us, double* %arrayidx28.us, align 8
  %exitcond73 = icmp eq i64 %indvars.iv.next64, 2099
  br i1 %exitcond73, label %for.inc42.us, label %for.body26.us.for.body26.us_crit_edge, !llvm.loop !1

for.body10.us:                                    ; preds = %for.body10.us, %for.body5.us.new
  %3 = phi double [ 0.000000e+00, %for.body5.us.new ], [ %add.us.1, %for.body10.us ]
  %indvars.iv = phi i64 [ 0, %for.body5.us.new ], [ %indvars.iv.next.1, %for.body10.us ]
  %arrayidx16.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv74, i64 %indvars.iv
  %4 = load double, double* %arrayidx16.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %5 = load double, double* %arrayidx18.us, align 8
  %mul.us = fmul double %4, %5
  %add.us = fadd double %3, %mul.us
  store double %add.us, double* %arrayidx7.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx16.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv74, i64 %indvars.iv.next
  %6 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx18.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %7 = load double, double* %arrayidx18.us.1, align 8
  %mul.us.1 = fmul double %6, %7
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %arrayidx7.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %for.body26.us.preheader, label %for.body10.us

for.body26.us.preheader:                          ; preds = %for.body10.us
  %8 = load double, double* %y, align 8
  %arrayidx32.us93 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv74, i64 0
  %9 = load double, double* %arrayidx32.us93, align 8
  %mul35.us94 = fmul double %9, %add.us.1
  %add36.us95 = fadd double %8, %mul35.us94
  store double %add36.us95, double* %y, align 8
  %bound0 = icmp ult double* %scevgep, %arrayidx7.us
  %bound1 = icmp ult double* %arrayidx7.us, %scevgep98
  %found.conflict = and i1 %bound0, %bound1
  %bound0105 = icmp ult double* %scevgep, %scevgep102
  %bound1106 = icmp ult double* %scevgep100, %scevgep98
  %found.conflict107 = and i1 %bound0105, %bound1106
  %conflict.rdx = or i1 %found.conflict, %found.conflict107
  br i1 %conflict.rdx, label %for.body26.us.for.body26.us_crit_edge.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body26.us.preheader
  br label %vector.body

for.body26.us.for.body26.us_crit_edge.preheader.loopexit: ; preds = %vector.body
  br label %for.body26.us.for.body26.us_crit_edge.preheader

for.body26.us.for.body26.us_crit_edge.preheader:  ; preds = %for.body26.us.for.body26.us_crit_edge.preheader.loopexit, %for.body26.us.preheader
  %indvars.iv6396.ph = phi i64 [ 0, %for.body26.us.preheader ], [ 2096, %for.body26.us.for.body26.us_crit_edge.preheader.loopexit ]
  br label %for.body26.us.for.body26.us_crit_edge

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %10 = or i64 %index, 1
  %11 = load double, double* %arrayidx7.us, align 8, !alias.scope !4
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  %14 = getelementptr inbounds double, double* %y, i64 %10
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !7, !noalias !9
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load109 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !7, !noalias !9
  %18 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv74, i64 %10
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load110 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !11
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load111 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !11
  %22 = fmul <2 x double> %wide.load110, %13
  %23 = fmul <2 x double> %wide.load111, %13
  %24 = fadd <2 x double> %wide.load, %22
  %25 = fadd <2 x double> %wide.load109, %23
  store <2 x double> %24, <2 x double>* %15, align 8, !alias.scope !7, !noalias !9
  store <2 x double> %25, <2 x double>* %17, align 8, !alias.scope !7, !noalias !9
  %index.next = add i64 %index, 4
  %26 = icmp eq i64 %index.next, 2096
  br i1 %26, label %for.body26.us.for.body26.us_crit_edge.preheader.loopexit, label %vector.body, !llvm.loop !12

for.end44:                                        ; preds = %for.inc42.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %y) unnamed_addr #0 {
for.body.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %if.end.for.body_crit_edge ]
  %storemerge2 = phi i32 [ 0, %for.body.lr.ph ], [ %6, %if.end.for.body_crit_edge ]
  %rem = srem i32 %storemerge2, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %3) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %5 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %5) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %for.end, label %if.end.for.body_crit_edge

if.end.for.body_crit_edge:                        ; preds = %if.end
  %6 = trunc i64 %indvars.iv.next to i32
  br label %for.body

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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!5, !10}
!10 = distinct !{!10, !6}
!11 = !{!10}
!12 = distinct !{!12, !2, !3}
