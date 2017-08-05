; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %0 = bitcast i8* %call to [1200 x double]*
  %1 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay43 = bitcast i8* %call2 to [1200 x double]*
  tail call fastcc void @init_array([1200 x double]* %0, [1200 x double]* %1, [1200 x double]* %arraydecay43)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt([1200 x double]* %0, [1200 x double]* %1, [1200 x double]* %arraydecay43)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call2 to [1200 x double]*
  %4 = bitcast i8* %call1 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %4, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc12.us, %entry
  %indvars.iv28 = phi i64 [ 0, %entry ], [ %indvars.iv.next29, %for.inc12.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %for.inc.us ], [ 0, %for.cond1.preheader.us ]
  %0 = mul nuw nsw i64 %indvars.iv28, %indvars.iv22
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv22
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv28, i64 %indvars.iv22
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond33, label %for.inc12.us, label %for.inc.us

for.inc12.us:                                     ; preds = %for.inc.us
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, 1000
  br i1 %exitcond, label %for.inc30.3.preheader, label %for.cond1.preheader.us

for.inc30.3.preheader:                            ; preds = %for.inc12.us
  br label %for.inc30.3

for.inc30.3:                                      ; preds = %for.inc30.3, %for.inc30.3.preheader
  %indvars.iv = phi i64 [ 0, %for.inc30.3.preheader ], [ %indvars.iv.next.3.1, %for.inc30.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 0
  %scevgep21 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep21, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next = or i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next, i64 0
  %scevgep21.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep21.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1, i64 0
  %scevgep21.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep21.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2, i64 0
  %scevgep21.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep21.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %scevgep.11 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.3, i64 0
  %scevgep21.12 = bitcast double* %scevgep.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep21.12, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.13 = or i64 %indvars.iv, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.13, i64 0
  %scevgep21.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep21.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.1.1 = or i64 %indvars.iv, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1.1, i64 0
  %scevgep21.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep21.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.2.1 = or i64 %indvars.iv, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2.1, i64 0
  %scevgep21.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep21.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond.3.1, label %for.inc30.3.for.end32_crit_edge, label %for.inc30.3

for.inc30.3.for.end32_crit_edge:                  ; preds = %for.inc30.3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc86, %entry
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.inc86 ]
  %indvars.iv62 = phi i64 [ 1, %entry ], [ %indvars.iv.next63, %for.inc86 ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc ], [ 0, %for.body ]
  %add8 = phi double [ %add.3, %for.inc ], [ 0.000000e+00, %for.body ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv70
  %0 = load double, double* %arrayidx5, align 8
  %mul = fmul double %0, %0
  %add = fadd double %add8, %mul
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv70
  %1 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %1, %1
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv70
  %2 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %2, %2
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv70
  %3 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %3, %3
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond.3, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %call = tail call double @sqrt(double %add.3) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv70, i64 %indvars.iv70
  store double %call, double* %arrayidx13, align 8
  %arrayidx2084 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv70
  %4 = load double, double* %arrayidx2084, align 8
  %div85 = fdiv double %4, %call
  %arrayidx2886 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv70
  store double %div85, double* %arrayidx2886, align 8
  br label %for.inc29.for.inc29_crit_edge

for.inc29.for.inc29_crit_edge:                    ; preds = %for.inc29.for.inc29_crit_edge.1, %for.end
  %indvars.iv4088 = phi i64 [ 0, %for.end ], [ %indvars.iv.next41.1, %for.inc29.for.inc29_crit_edge.1 ]
  %indvars.iv.next41 = or i64 %indvars.iv4088, 1
  %.pre = load double, double* %arrayidx13, align 8
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next41, i64 %indvars.iv70
  %5 = load double, double* %arrayidx20, align 8
  %div = fdiv double %5, %.pre
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next41, i64 %indvars.iv70
  store double %div, double* %arrayidx28, align 8
  %exitcond74 = icmp eq i64 %indvars.iv.next41, 999
  br i1 %exitcond74, label %for.end31, label %for.inc29.for.inc29_crit_edge.1

for.end31:                                        ; preds = %for.inc29.for.inc29_crit_edge
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %cmp3423 = icmp slt i64 %indvars.iv.next71, 1200
  br i1 %cmp3423, label %for.body35.us.preheader, label %for.inc86

for.body35.us.preheader:                          ; preds = %for.end31
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.body35.us.preheader, %for.inc83.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.inc83.us ], [ %indvars.iv62, %for.body35.us.preheader ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv70, i64 %indvars.iv64
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br label %for.inc57.us

for.inc57.us:                                     ; preds = %for.inc57.us, %for.body35.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.1, %for.inc57.us ], [ 0, %for.body35.us ]
  %6 = phi double [ %add56.us.1, %for.inc57.us ], [ 0.000000e+00, %for.body35.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv50, i64 %indvars.iv70
  %7 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv64
  %8 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %7, %8
  %add56.us = fadd double %mul51.us, %6
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next51 = or i64 %indvars.iv50, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next51, i64 %indvars.iv70
  %9 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next51, i64 %indvars.iv64
  %10 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %9, %10
  %add56.us.1 = fadd double %mul51.us.1, %add56.us
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  %exitcond53.1 = icmp eq i64 %indvars.iv.next51.1, 1000
  br i1 %exitcond53.1, label %for.inc80.us.preheader, label %for.inc57.us

for.inc80.us.preheader:                           ; preds = %for.inc57.us
  br label %for.inc80.us

for.inc80.us:                                     ; preds = %for.inc80.us.preheader, %for.inc80.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.1, %for.inc80.us ], [ 0, %for.inc80.us.preheader ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv56, i64 %indvars.iv64
  %11 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv56, i64 %indvars.iv70
  %12 = load double, double* %arrayidx70.us, align 8
  %13 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %12, %13
  %sub.us = fsub double %11, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next57 = or i64 %indvars.iv56, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next57, i64 %indvars.iv64
  %14 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next57, i64 %indvars.iv70
  %15 = load double, double* %arrayidx70.us.1, align 8
  %16 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %15, %16
  %sub.us.1 = fsub double %14, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next57.1, 1000
  br i1 %exitcond59.1, label %for.inc83.us, label %for.inc80.us

for.inc83.us:                                     ; preds = %for.inc80.us
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond = icmp eq i64 %indvars.iv.next65, 1200
  br i1 %exitcond, label %for.inc86.loopexit, label %for.body35.us

for.inc86.loopexit:                               ; preds = %for.inc83.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit, %for.end31
  %exitcond75 = icmp eq i64 %indvars.iv.next71, 1200
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  br i1 %exitcond75, label %for.end88, label %for.body

for.end88:                                        ; preds = %for.inc86
  ret void

for.inc29.for.inc29_crit_edge.1:                  ; preds = %for.inc29.for.inc29_crit_edge
  %indvars.iv.next41.1 = add nsw i64 %indvars.iv4088, 2
  %.pre.1 = load double, double* %arrayidx13, align 8
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next41.1, i64 %indvars.iv70
  %17 = load double, double* %arrayidx20.1, align 8
  %div.1 = fdiv double %17, %.pre.1
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next41.1, i64 %indvars.iv70
  store double %div.1, double* %arrayidx28.1, align 8
  br label %for.inc29.for.inc29_crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv30 = phi i64 [ 0, %entry ], [ %indvars.iv.next31, %for.inc10 ]
  %3 = mul nsw i64 %indvars.iv30, 1200
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv25 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next26, %for.inc ]
  %4 = add nsw i64 %3, %indvars.iv25
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv30, i64 %indvars.iv25
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond36, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next31, 1200
  br i1 %exitcond37, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.inc36.us, %for.end12
  %indvars.iv19 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next20, %for.inc36.us ]
  %11 = mul nsw i64 %indvars.iv19, 1200
  br label %for.body20.us

for.body20.us:                                    ; preds = %for.inc33.us, %for.cond18.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc33.us ], [ 0, %for.cond18.preheader.us ]
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
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv19, i64 %indvars.iv
  %16 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond35, label %for.inc36.us, label %for.body20.us

for.inc36.us:                                     ; preds = %for.inc33.us
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond, label %for.end38, label %for.cond18.preheader.us

for.end38:                                        ; preds = %for.inc36.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
