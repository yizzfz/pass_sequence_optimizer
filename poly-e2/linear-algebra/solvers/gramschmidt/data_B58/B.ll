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
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %0 = bitcast i8* %call to [1200 x double]*
  %1 = bitcast i8* %call1 to [1200 x double]*
  %2 = bitcast i8* %call2 to [1200 x double]*
  tail call void @init_array([1200 x double]* %0, [1200 x double]* %1, [1200 x double]* %2)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_gramschmidt([1200 x double]* %0, [1200 x double]* %1, [1200 x double]* %2)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %3, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = bitcast i8* %call2 to [1200 x double]*
  %5 = bitcast i8* %call1 to [1200 x double]*
  tail call void @print_array([1200 x double]* %5, [1200 x double]* %4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc12_crit_edge.us, %entry
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.cond1.for.inc12_crit_edge.us ], [ 0, %entry ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv25 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next26, %for.inc.us ]
  %0 = mul nsw i64 %indvars.iv30, %indvars.iv25
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv25
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv30, i64 %indvars.iv25
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond29, label %for.cond1.for.inc12_crit_edge.us, label %for.inc.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next31 = add nsw i64 %indvars.iv30, 1
  %cmp.us = icmp slt i64 %indvars.iv.next31, 1000
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond19.for.inc30_crit_edge.us.preheader

for.cond19.for.inc30_crit_edge.us.preheader:      ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond19.for.inc30_crit_edge.us

for.cond19.for.inc30_crit_edge.us:                ; preds = %for.cond19.for.inc30_crit_edge.us, %for.cond19.for.inc30_crit_edge.us.preheader
  %indvar = phi i64 [ 0, %for.cond19.for.inc30_crit_edge.us.preheader ], [ %indvar.next.5, %for.cond19.for.inc30_crit_edge.us ]
  %indvars.iv23 = phi i64 [ 0, %for.cond19.for.inc30_crit_edge.us.preheader ], [ %indvars.iv.next24.5, %for.cond19.for.inc30_crit_edge.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvar, i64 0
  %scevgep34 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep34, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next = or i64 %indvar, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvar.next, i64 0
  %scevgep34.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep34.1, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.1 = add nsw i64 %indvar, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvar.next.1, i64 0
  %scevgep34.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep34.2, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.2 = add nsw i64 %indvar, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvar.next.2, i64 0
  %scevgep34.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep34.3, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.3 = add nsw i64 %indvar, 4
  %scevgep.4 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvar.next.3, i64 0
  %scevgep34.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep34.4, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.4 = add nsw i64 %indvar, 5
  %scevgep.5 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvar.next.4, i64 0
  %scevgep34.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep34.5, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next24.5 = add nsw i64 %indvars.iv23, 6
  %cmp16.us.5 = icmp slt i64 %indvars.iv.next24.5, 1200
  %indvar.next.5 = add nsw i64 %indvar, 6
  br i1 %cmp16.us.5, label %for.cond19.for.inc30_crit_edge.us, label %for.end32

for.end32:                                        ; preds = %for.cond19.for.inc30_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gramschmidt([1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc86.for.body_crit_edge, %entry
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %for.inc86.for.body_crit_edge ], [ 0, %entry ]
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %for.inc86.for.body_crit_edge ], [ 1, %entry ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next.4, %for.inc ]
  %add8 = phi double [ 0.000000e+00, %for.body ], [ %add.4, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv112
  %0 = load double, double* %arrayidx5, align 8
  %mul = fmul double %0, %0
  %add = fadd double %add8, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv112
  %1 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %1, %1
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv112
  %2 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %2, %2
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv112
  %3 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %3, %3
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx5.4 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.3, i64 %indvars.iv112
  %4 = load double, double* %arrayidx5.4, align 8
  %mul.4 = fmul double %4, %4
  %add.4 = fadd double %add.3, %mul.4
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1000
  br i1 %exitcond.4, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %call = tail call double @sqrt(double %add.4) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv112, i64 %indvars.iv112
  store double %call, double* %arrayidx13, align 8
  %arrayidx201 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv112
  %5 = load double, double* %arrayidx201, align 8
  %div2 = fdiv double %5, %call
  %arrayidx283 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv112
  store double %div2, double* %arrayidx283, align 8
  br label %for.inc29.for.inc29_crit_edge

for.inc29.for.inc29_crit_edge:                    ; preds = %for.inc29.for.inc29_crit_edge.1, %for.end
  %indvars.iv.next804 = phi i64 [ 1, %for.end ], [ %indvars.iv.next80.1, %for.inc29.for.inc29_crit_edge.1 ]
  %.pre = load double, double* %arrayidx13, align 8
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next804, i64 %indvars.iv112
  %6 = load double, double* %arrayidx20, align 8
  %div = fdiv double %6, %.pre
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next804, i64 %indvars.iv112
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv.next804, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next80, 1000
  br i1 %exitcond82, label %for.end31, label %for.inc29.for.inc29_crit_edge.1

for.end31:                                        ; preds = %for.inc29.for.inc29_crit_edge
  %indvars.iv.next113 = add nsw i64 %indvars.iv112, 1
  %cmp3423 = icmp slt i64 %indvars.iv.next113, 1200
  br i1 %cmp3423, label %for.body35.us.preheader, label %for.end88

for.body35.us.preheader:                          ; preds = %for.end31
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.body35.us.preheader, %for.inc83.us
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %for.inc83.us ], [ %indvars.iv106, %for.body35.us.preheader ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv112, i64 %indvars.iv108
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br label %for.inc57.us

for.inc83.us:                                     ; preds = %for.inc80.us.for.inc80.us_crit_edge
  %indvars.iv.next109 = add nsw i64 %indvars.iv108, 1
  %lftr.wideiv110 = trunc i64 %indvars.iv.next109 to i32
  %exitcond111 = icmp eq i32 %lftr.wideiv110, 1200
  br i1 %exitcond111, label %for.inc86.for.body_crit_edge, label %for.body35.us

for.inc80.us.for.inc80.us_crit_edge:              ; preds = %for.inc80.us.for.inc80.us_crit_edge.1, %for.inc57.us.for.inc80.us_crit_edge
  %indvars.iv.next1039 = phi i64 [ 1, %for.inc57.us.for.inc80.us_crit_edge ], [ %indvars.iv.next103.1, %for.inc80.us.for.inc80.us_crit_edge.1 ]
  %.pre115 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next1039, i64 %indvars.iv108
  %7 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next1039, i64 %indvars.iv112
  %8 = load double, double* %arrayidx70.us, align 8
  %mul75.us = fmul double %8, %.pre115
  %sub.us = fsub double %7, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv.next1039, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next103, 1000
  br i1 %exitcond105, label %for.inc83.us, label %for.inc80.us.for.inc80.us_crit_edge.1

for.inc57.us:                                     ; preds = %for.inc57.us, %for.body35.us
  %9 = phi double [ 0.000000e+00, %for.body35.us ], [ %add56.us.1, %for.inc57.us ]
  %indvars.iv98 = phi i64 [ 0, %for.body35.us ], [ %indvars.iv.next99.1, %for.inc57.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv98, i64 %indvars.iv112
  %10 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv98, i64 %indvars.iv108
  %11 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %10, %11
  %add56.us = fadd double %mul51.us, %9
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next99 = or i64 %indvars.iv98, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next99, i64 %indvars.iv112
  %12 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next99, i64 %indvars.iv108
  %13 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %12, %13
  %add56.us.1 = fadd double %mul51.us.1, %add56.us
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next99.1 = add nsw i64 %indvars.iv98, 2
  %exitcond101.1 = icmp eq i64 %indvars.iv.next99.1, 1000
  br i1 %exitcond101.1, label %for.inc57.us.for.inc80.us_crit_edge, label %for.inc57.us

for.inc57.us.for.inc80.us_crit_edge:              ; preds = %for.inc57.us
  %arrayidx66.us5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv108
  %14 = load double, double* %arrayidx66.us5, align 8
  %sunkaddr = ptrtoint [1200 x double]* %Q to i64
  %sunkaddr10 = mul i64 %indvars.iv112, 8
  %sunkaddr11 = add i64 %sunkaddr, %sunkaddr10
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to double*
  %15 = load double, double* %sunkaddr12, align 8
  %mul75.us7 = fmul double %15, %add56.us.1
  %sub.us8 = fsub double %14, %mul75.us7
  store double %sub.us8, double* %arrayidx66.us5, align 8
  br label %for.inc80.us.for.inc80.us_crit_edge

for.inc86.for.body_crit_edge:                     ; preds = %for.inc83.us
  %indvars.iv.next107 = add nsw i64 %indvars.iv106, 1
  br label %for.body

for.end88:                                        ; preds = %for.end31
  ret void

for.inc29.for.inc29_crit_edge.1:                  ; preds = %for.inc29.for.inc29_crit_edge
  %.pre.1 = load double, double* %arrayidx13, align 8
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next80, i64 %indvars.iv112
  %16 = load double, double* %arrayidx20.1, align 8
  %div.1 = fdiv double %16, %.pre.1
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next80, i64 %indvars.iv112
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv.next804, 2
  br label %for.inc29.for.inc29_crit_edge

for.inc80.us.for.inc80.us_crit_edge.1:            ; preds = %for.inc80.us.for.inc80.us_crit_edge
  %.pre115.1 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next103, i64 %indvars.iv108
  %17 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next103, i64 %indvars.iv112
  %18 = load double, double* %arrayidx70.us.1, align 8
  %mul75.us.1 = fmul double %18, %.pre115.1
  %sub.us.1 = fsub double %17, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv.next1039, 2
  br label %for.inc80.us.for.inc80.us_crit_edge
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* %R, [1200 x double]* %Q) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv30 = phi i64 [ 0, %entry ], [ %indvars.iv.next31, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv30, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv25 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next26, %for.inc.us ]
  %4 = add nsw i64 %3, %indvars.iv25
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv30, i64 %indvars.iv25
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond29, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next31 = add nsw i64 %indvars.iv30, 1
  %cmp.us = icmp slt i64 %indvars.iv.next31, 1200
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.for.inc36_crit_edge.us, %for.end12
  %indvars.iv22 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next23, %for.cond18.for.inc36_crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv22, 1200
  br label %for.body20.us

for.body20.us:                                    ; preds = %for.inc33.us, %for.cond18.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next, %for.inc33.us ]
  %12 = add nsw i64 %11, %indvars.iv
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
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv22, i64 %indvars.iv
  %16 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond18.for.inc36_crit_edge.us, label %for.body20.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %for.inc33.us
  %indvars.iv.next23 = add nsw i64 %indvars.iv22, 1
  %cmp16.us = icmp slt i64 %indvars.iv.next23, 1000
  br i1 %cmp16.us, label %for.cond18.preheader.us, label %for.end38

for.end38:                                        ; preds = %for.cond18.for.inc36_crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
