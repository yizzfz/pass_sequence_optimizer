; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  tail call void @init_array([1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_gramschmidt([1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  tail call void @print_array([1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc12_crit_edge.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.cond1.for.inc12_crit_edge.us ], [ 0, %entry ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv29 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next30, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv34, %indvars.iv29
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv29
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv34, i64 %indvars.iv29
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next30, 1200
  br i1 %exitcond, label %for.cond1.for.inc12_crit_edge.us, label %for.inc.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next35, 1000
  br i1 %exitcond46, label %for.cond19.for.inc30_crit_edge.us.3.preheader, label %for.cond1.preheader.us

for.cond19.for.inc30_crit_edge.us.3.preheader:    ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond19.for.inc30_crit_edge.us.3

for.end32:                                        ; preds = %for.cond19.for.inc30_crit_edge.us.3
  ret void

for.cond19.for.inc30_crit_edge.us.3:              ; preds = %for.cond19.for.inc30_crit_edge.us.3, %for.cond19.for.inc30_crit_edge.us.3.preheader
  %indvars.iv24 = phi i64 [ 0, %for.cond19.for.inc30_crit_edge.us.3.preheader ], [ %indvars.iv.next25.3.1, %for.cond19.for.inc30_crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv24, i64 0
  %scevgep39 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep39, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next25 = or i64 %indvars.iv24, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next25, i64 0
  %scevgep39.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep39.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next25.1 = or i64 %indvars.iv24, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next25.1, i64 0
  %scevgep39.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep39.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next25.2 = or i64 %indvars.iv24, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next25.2, i64 0
  %scevgep39.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep39.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next25.3 = or i64 %indvars.iv24, 4
  %scevgep.11 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next25.3, i64 0
  %scevgep39.12 = bitcast double* %scevgep.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep39.12, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next25.13 = or i64 %indvars.iv24, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next25.13, i64 0
  %scevgep39.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep39.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next25.1.1 = or i64 %indvars.iv24, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next25.1.1, i64 0
  %scevgep39.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep39.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next25.2.1 = or i64 %indvars.iv24, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next25.2.1, i64 0
  %scevgep39.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep39.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next25.3.1 = add nsw i64 %indvars.iv24, 8
  %exitcond27.3.1 = icmp eq i64 %indvars.iv.next25.3.1, 1200
  br i1 %exitcond27.3.1, label %for.end32, label %for.cond19.for.inc30_crit_edge.us.3
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gramschmidt([1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc86, %entry
  %indvars.iv113 = phi i64 [ 0, %entry ], [ %6, %for.inc86 ]
  %indvars.iv107 = phi i64 [ 1, %entry ], [ %indvars.iv.next108, %for.inc86 ]
  br label %for.inc

for.inc:                                          ; preds = %for.body, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc ], [ 0, %for.body ]
  %add8 = phi double [ %add.3, %for.inc ], [ 0.000000e+00, %for.body ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv113
  %0 = load double, double* %arrayidx5, align 8
  %mul = fmul double %0, %0
  %add = fadd double %add8, %mul
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv113
  %1 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %1, %1
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv113
  %2 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %2, %2
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv113
  %3 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %3, %3
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond.3, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %call = tail call double @sqrt(double %add.3) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv113, i64 %indvars.iv113
  store double %call, double* %arrayidx13, align 8
  %arrayidx201 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv113
  %4 = load double, double* %arrayidx201, align 8
  %div2 = fdiv double %4, %call
  %arrayidx283 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv113
  store double %div2, double* %arrayidx283, align 8
  br label %for.inc29.for.inc29_crit_edge

for.inc29.for.inc29_crit_edge:                    ; preds = %for.inc29.for.inc29_crit_edge.1, %for.end
  %indvars.iv814 = phi i64 [ 0, %for.end ], [ %indvars.iv.next82.1, %for.inc29.for.inc29_crit_edge.1 ]
  %indvars.iv.next82 = or i64 %indvars.iv814, 1
  %.pre = load double, double* %arrayidx13, align 8
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next82, i64 %indvars.iv113
  %5 = load double, double* %arrayidx20, align 8
  %div = fdiv double %5, %.pre
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next82, i64 %indvars.iv113
  store double %div, double* %arrayidx28, align 8
  %exitcond = icmp eq i64 %indvars.iv.next82, 999
  br i1 %exitcond, label %for.end31, label %for.inc29.for.inc29_crit_edge.1

for.end31:                                        ; preds = %for.inc29.for.inc29_crit_edge
  %6 = add nuw nsw i64 %indvars.iv113, 1
  %cmp3423 = icmp slt i64 %6, 1200
  br i1 %cmp3423, label %for.body35.us.preheader, label %for.inc86

for.body35.us.preheader:                          ; preds = %for.end31
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.body35.us.preheader, %for.inc83.us
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %for.inc83.us ], [ %indvars.iv107, %for.body35.us.preheader ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv113, i64 %indvars.iv109
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br label %for.inc57.us

for.inc83.us:                                     ; preds = %for.inc80.us.for.inc80.us_crit_edge
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next110, 1200
  br i1 %exitcond129, label %for.inc86.loopexit, label %for.body35.us

for.inc80.us.for.inc80.us_crit_edge:              ; preds = %for.inc80.us.for.inc80.us_crit_edge.1, %for.inc80.us.preheader
  %indvars.iv1039 = phi i64 [ 0, %for.inc80.us.preheader ], [ %indvars.iv.next104.1, %for.inc80.us.for.inc80.us_crit_edge.1 ]
  %indvars.iv.next104 = or i64 %indvars.iv1039, 1
  %.pre79 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next104, i64 %indvars.iv109
  %7 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next104, i64 %indvars.iv113
  %8 = load double, double* %arrayidx70.us, align 8
  %mul75.us = fmul double %8, %.pre79
  %sub.us = fsub double %7, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %exitcond125 = icmp eq i64 %indvars.iv.next104, 999
  br i1 %exitcond125, label %for.inc83.us, label %for.inc80.us.for.inc80.us_crit_edge.1

for.inc57.us:                                     ; preds = %for.body35.us, %for.inc57.us
  %indvars.iv99 = phi i64 [ %indvars.iv.next100.1, %for.inc57.us ], [ 0, %for.body35.us ]
  %9 = phi double [ %add56.us.1, %for.inc57.us ], [ 0.000000e+00, %for.body35.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv99, i64 %indvars.iv113
  %10 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv109
  %11 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %10, %11
  %add56.us = fadd double %mul51.us, %9
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next100 = or i64 %indvars.iv99, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next100, i64 %indvars.iv113
  %12 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next100, i64 %indvars.iv109
  %13 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %12, %13
  %add56.us.1 = fadd double %mul51.us.1, %add56.us
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next100.1 = add nuw nsw i64 %indvars.iv99, 2
  %exitcond102.1 = icmp eq i64 %indvars.iv.next100.1, 1000
  br i1 %exitcond102.1, label %for.inc80.us.preheader, label %for.inc57.us

for.inc80.us.preheader:                           ; preds = %for.inc57.us
  %arrayidx66.us5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv109
  %14 = load double, double* %arrayidx66.us5, align 8
  %15 = load double, double* %arrayidx283, align 8
  %mul75.us7 = fmul double %15, %add56.us.1
  %sub.us8 = fsub double %14, %mul75.us7
  store double %sub.us8, double* %arrayidx66.us5, align 8
  br label %for.inc80.us.for.inc80.us_crit_edge

for.inc86.loopexit:                               ; preds = %for.inc83.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit, %for.end31
  %exitcond130 = icmp eq i64 %6, 1200
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  br i1 %exitcond130, label %for.end88, label %for.body

for.end88:                                        ; preds = %for.inc86
  ret void

for.inc29.for.inc29_crit_edge.1:                  ; preds = %for.inc29.for.inc29_crit_edge
  %indvars.iv.next82.1 = add nsw i64 %indvars.iv814, 2
  %.pre.1 = load double, double* %arrayidx13, align 8
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next82.1, i64 %indvars.iv113
  %16 = load double, double* %arrayidx20.1, align 8
  %div.1 = fdiv double %16, %.pre.1
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next82.1, i64 %indvars.iv113
  store double %div.1, double* %arrayidx28.1, align 8
  br label %for.inc29.for.inc29_crit_edge

for.inc80.us.for.inc80.us_crit_edge.1:            ; preds = %for.inc80.us.for.inc80.us_crit_edge
  %indvars.iv.next104.1 = add nsw i64 %indvars.iv1039, 2
  %.pre79.1 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next104.1, i64 %indvars.iv109
  %17 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next104.1, i64 %indvars.iv113
  %18 = load double, double* %arrayidx70.us.1, align 8
  %mul75.us.1 = fmul double %18, %.pre79.1
  %sub.us.1 = fsub double %17, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  br label %for.inc80.us.for.inc80.us_crit_edge
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly %R, [1200 x double]* nocapture readonly %Q) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv39 = phi i64 [ 0, %entry ], [ %indvars.iv.next40, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv39, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv34 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next35, %for.inc.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv34
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv39, i64 %indvars.iv34
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next35, 1200
  br i1 %exitcond48, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond50, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.for.inc36_crit_edge.us, %for.end12
  %indvars.iv28 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next29, %for.cond18.for.inc36_crit_edge.us ]
  %11 = mul nuw nsw i64 %indvars.iv28, 1200
  br label %for.body20.us

for.body20.us:                                    ; preds = %for.inc33.us, %for.cond18.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next, %for.inc33.us ]
  %12 = add nuw nsw i64 %11, %indvars.iv
  %13 = trunc i64 %12 to i32
  %rem23.us = srem i32 %13, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %for.inc33.us

if.then25.us:                                     ; preds = %for.body20.us
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.body20.us, %if.then25.us
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv28, i64 %indvars.iv
  %16 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond46, label %for.cond18.for.inc36_crit_edge.us, label %for.body20.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %for.inc33.us
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, 1000
  br i1 %exitcond, label %for.end38, label %for.cond18.preheader.us

for.end38:                                        ; preds = %for.cond18.for.inc36_crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
