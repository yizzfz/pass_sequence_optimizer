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
  %0 = bitcast i8* %call to [2100 x double]*
  %1 = bitcast i8* %call1 to double*
  call fastcc void @init_array(i32 1900, i32 2100, [2100 x double]* %0, double* %1)
  call void (...) @polybench_timer_start() #4
  %2 = bitcast i8* %call2 to double*
  %3 = bitcast i8* %call3 to double*
  call fastcc void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %0, double* %1, double* %2, double* %3)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %4, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = bitcast i8* %call2 to double*
  call fastcc void @print_array(i32 2100, double* %5)
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
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %entry
  %indvars.iv16 = phi i64 [ 0, %entry ], [ %indvars.iv.next17.2, %for.inc ]
  %0 = trunc i64 %indvars.iv16 to i32
  %conv2 = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv16
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %1 = trunc i64 %indvars.iv.next17 to i32
  %conv2.1 = sitofp i32 %1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv2, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv2.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.100000e+03, double 2.100000e+03>
  %add = fadd <2 x double> %div, <double 1.000000e+00, double 1.000000e+00>
  %2 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> %add, <2 x double>* %2, align 8
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, 2
  %3 = trunc i64 %indvars.iv.next17.1 to i32
  %conv2.2 = sitofp i32 %3 to double
  %div.2 = fdiv double %conv2.2, 2.100000e+03
  %add.2 = fadd double %div.2, 1.000000e+00
  %arrayidx.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next17.1
  store double %add.2, double* %arrayidx.2, align 8
  %indvars.iv.next17.2 = add nsw i64 %indvars.iv16, 3
  %cmp.2 = icmp slt i64 %indvars.iv.next17.2, 2100
  br i1 %cmp.2, label %for.inc, label %for.body6.us.preheader

for.body6.us.preheader:                           ; preds = %for.inc
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us.preheader, %for.cond7.for.inc22_crit_edge.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.cond7.for.inc22_crit_edge.us ], [ 0, %for.body6.us.preheader ]
  br label %for.inc19.us

for.inc19.us:                                     ; preds = %for.inc19.us.for.inc19.us_crit_edge, %for.body6.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc19.us.for.inc19.us_crit_edge ], [ 0, %for.body6.us ]
  %4 = add nsw i64 %indvars.iv14, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 2100
  %conv12.us = sitofp i32 %rem.us to double
  %div14.us = fdiv double %conv12.us, 9.500000e+03
  %arrayidx18.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv
  store double %div14.us, double* %arrayidx18.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, 2099
  br i1 %exitcond, label %for.cond7.for.inc22_crit_edge.us, label %for.inc19.us.for.inc19.us_crit_edge

for.inc19.us.for.inc19.us_crit_edge:              ; preds = %for.inc19.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc19.us

for.cond7.for.inc22_crit_edge.us:                 ; preds = %for.inc19.us
  %indvars.iv.next15 = add i64 %indvars.iv14, 1
  %cmp4.us = icmp slt i64 %indvars.iv.next15, 1900
  br i1 %cmp4.us, label %for.body6.us, label %for.end24

for.end24:                                        ; preds = %for.cond7.for.inc22_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_atax(i32 %m, i32 %n, [2100 x double]* nocapture readonly %A, double* nocapture readonly %x, double* nocapture %y, double* nocapture %tmp) unnamed_addr #0 {
entry:
  %scevgep7677 = bitcast double* %y to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7677, i8 0, i64 16800, i32 8, i1 false)
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %entry
  %indvars.iv73 = phi i64 [ 0, %entry ], [ %indvars.iv.next74.24, %for.inc ]
  %indvars.iv.next74.24 = add nsw i64 %indvars.iv73, 25
  %cmp.24 = icmp slt i64 %indvars.iv.next74.24, 2100
  br i1 %cmp.24, label %for.inc, label %for.body5.us.preheader

for.body5.us.preheader:                           ; preds = %for.inc
  %sunkaddr86 = ptrtoint double* %tmp to i64
  %sunkaddr = ptrtoint double* %tmp to i64
  %sunkaddr90 = ptrtoint double* %tmp to i64
  %sunkaddr94 = ptrtoint double* %y to i64
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.body5.us.preheader, %for.inc42.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.inc42.us ], [ 0, %for.body5.us.preheader ]
  %arrayidx7.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv64
  store double 0.000000e+00, double* %arrayidx7.us, align 8
  %sunkaddr87 = mul i64 %indvars.iv64, 8
  %sunkaddr88 = add i64 %sunkaddr86, %sunkaddr87
  %sunkaddr89 = inttoptr i64 %sunkaddr88 to double*
  br label %for.inc21.us

for.inc42.us:                                     ; preds = %for.inc39.us.for.inc39.us_crit_edge
  %indvars.iv.next65 = add i64 %indvars.iv64, 1
  %cmp4.us = icmp slt i64 %indvars.iv.next65, 1900
  br i1 %cmp4.us, label %for.body5.us, label %for.end44

for.inc39.us.for.inc39.us_crit_edge:              ; preds = %for.inc39.us.for.inc39.us_crit_edge.1, %for.inc39.us.preheader
  %indvars.iv.next6382 = phi i64 [ 1, %for.inc39.us.preheader ], [ %indvars.iv.next63.1, %for.inc39.us.for.inc39.us_crit_edge.1 ]
  %.pre = load double, double* %sunkaddr85, align 8
  %arrayidx28.us = getelementptr inbounds double, double* %y, i64 %indvars.iv.next6382
  %0 = load double, double* %arrayidx28.us, align 8
  %arrayidx32.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv.next6382
  %1 = load double, double* %arrayidx32.us, align 8
  %mul35.us = fmul double %1, %.pre
  %add36.us = fadd double %0, %mul35.us
  store double %add36.us, double* %arrayidx28.us, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv.next6382, 1
  %cmp25.us = icmp slt i64 %indvars.iv.next63, 2100
  br i1 %cmp25.us, label %for.inc39.us.for.inc39.us_crit_edge.1, label %for.inc42.us

for.inc21.us:                                     ; preds = %for.inc21.us, %for.body5.us
  %2 = phi double [ 0.000000e+00, %for.body5.us ], [ %add.us.2, %for.inc21.us ]
  %indvars.iv = phi i64 [ 0, %for.body5.us ], [ %indvars.iv.next.2, %for.inc21.us ]
  %arrayidx16.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv
  %3 = load double, double* %arrayidx16.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %4 = load double, double* %arrayidx18.us, align 8
  %mul.us = fmul double %3, %4
  %add.us = fadd double %2, %mul.us
  store double %add.us, double* %sunkaddr89, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx16.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv.next
  %5 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx18.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %6 = load double, double* %arrayidx18.us.1, align 8
  %mul.us.1 = fmul double %5, %6
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %sunkaddr89, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx16.us.2 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv.next.1
  %7 = load double, double* %arrayidx16.us.2, align 8
  %arrayidx18.us.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next.1
  %8 = load double, double* %arrayidx18.us.2, align 8
  %mul.us.2 = fmul double %7, %8
  %add.us.2 = fadd double %add.us.1, %mul.us.2
  store double %add.us.2, double* %sunkaddr89, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %cmp9.us.2 = icmp slt i64 %indvars.iv.next.2, 2100
  br i1 %cmp9.us.2, label %for.inc21.us, label %for.inc39.us.preheader

for.inc39.us.preheader:                           ; preds = %for.inc21.us
  %9 = load double, double* %y, align 8
  %arrayidx32.us79 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv64, i64 0
  %10 = load double, double* %arrayidx32.us79, align 8
  %mul35.us80 = fmul double %10, %add.us.2
  %add36.us81 = fadd double %9, %mul35.us80
  store double %add36.us81, double* %y, align 8
  %sunkaddr83 = mul i64 %indvars.iv64, 8
  %sunkaddr84 = add i64 %sunkaddr, %sunkaddr83
  %sunkaddr85 = inttoptr i64 %sunkaddr84 to double*
  %sunkaddr91 = mul i64 %indvars.iv64, 8
  %sunkaddr92 = add i64 %sunkaddr90, %sunkaddr91
  %sunkaddr93 = inttoptr i64 %sunkaddr92 to double*
  br label %for.inc39.us.for.inc39.us_crit_edge

for.end44:                                        ; preds = %for.inc42.us
  ret void

for.inc39.us.for.inc39.us_crit_edge.1:            ; preds = %for.inc39.us.for.inc39.us_crit_edge
  %.pre.1 = load double, double* %sunkaddr93, align 8
  %sunkaddr95 = mul i64 %indvars.iv.next6382, 8
  %sunkaddr96 = add i64 %sunkaddr94, %sunkaddr95
  %sunkaddr97 = add i64 %sunkaddr96, 8
  %sunkaddr98 = inttoptr i64 %sunkaddr97 to double*
  %11 = load double, double* %sunkaddr98, align 8
  %arrayidx32.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv.next63
  %12 = load double, double* %arrayidx32.us.1, align 8
  %mul35.us.1 = fmul double %12, %.pre.1
  %add36.us.1 = fadd double %11, %mul35.us.1
  store double %add36.us.1, double* %sunkaddr98, align 8
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv.next6382, 2
  br label %for.inc39.us.for.inc39.us_crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %y) unnamed_addr #0 {
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
  %indvars.iv.next = add i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, 2100
  br i1 %cmp, label %for.body, label %for.end

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
