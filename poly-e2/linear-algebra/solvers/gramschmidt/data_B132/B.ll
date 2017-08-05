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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  tail call fastcc void @init_array([1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt([1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  tail call fastcc void @print_array([1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #2 {
entry:
  br label %for.body3.lr.ph.us

for.body3.lr.ph.us:                               ; preds = %for.end.us, %entry
  %indvars.iv26 = phi i64 [ 0, %entry ], [ %indvars.iv.next27, %for.end.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.lr.ph.us
  %indvars.iv19 = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next20, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv19, %indvars.iv26
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv26, i64 %indvars.iv19
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv26, i64 %indvars.iv19
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond = icmp eq i64 %indvars.iv.next20, 1200
  br i1 %exitcond, label %for.end.us, label %for.body3.us

for.end.us:                                       ; preds = %for.body3.us
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next27, 1000
  br i1 %exitcond32, label %for.end29.us.3.preheader, label %for.body3.lr.ph.us

for.end29.us.3.preheader:                         ; preds = %for.end.us
  br label %for.end29.us.3

for.end29.us.3:                                   ; preds = %for.end29.us.3, %for.end29.us.3.preheader
  %indvars.iv15 = phi i64 [ 0, %for.end29.us.3.preheader ], [ %indvars.iv.next16.3.1, %for.end29.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv15, i64 0
  %scevgep14 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16 = or i64 %indvars.iv15, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16, i64 0
  %scevgep14.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16.1 = or i64 %indvars.iv15, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16.1, i64 0
  %scevgep14.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16.2 = or i64 %indvars.iv15, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16.2, i64 0
  %scevgep14.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16.3 = or i64 %indvars.iv15, 4
  %scevgep.11 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16.3, i64 0
  %scevgep14.12 = bitcast double* %scevgep.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.12, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16.13 = or i64 %indvars.iv15, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16.13, i64 0
  %scevgep14.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16.1.1 = or i64 %indvars.iv15, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16.1.1, i64 0
  %scevgep14.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16.2.1 = or i64 %indvars.iv15, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16.2.1, i64 0
  %scevgep14.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16.3.1 = add nsw i64 %indvars.iv15, 8
  %exitcond18.3.1 = icmp eq i64 %indvars.iv.next16.3.1, 1200
  br i1 %exitcond18.3.1, label %for.end29.us.3.for.end32_crit_edge, label %for.end29.us.3

for.end29.us.3.for.end32_crit_edge:               ; preds = %for.end29.us.3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  br label %for.cond.for.cond1_crit_edge

for.cond.for.cond1_crit_edge:                     ; preds = %for.end85.for.cond.for.cond1_crit_edge_crit_edge, %entry
  %indvars.iv78 = phi i64 [ 0, %entry ], [ %indvars.iv.next79, %for.end85.for.cond.for.cond1_crit_edge_crit_edge ]
  %indvars.iv70 = phi i64 [ 1, %entry ], [ %indvars.iv.next71, %for.end85.for.cond.for.cond1_crit_edge_crit_edge ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond.for.cond1_crit_edge
  %indvars.iv = phi i64 [ 0, %for.cond.for.cond1_crit_edge ], [ %indvars.iv.next.3, %for.body3 ]
  %nrm.07 = phi double [ 0.000000e+00, %for.cond.for.cond1_crit_edge ], [ %add.3, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv78
  %0 = load double, double* %arrayidx5, align 8
  %mul = fmul double %0, %0
  %add = fadd double %nrm.07, %mul
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv78
  %1 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %1, %1
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv78
  %2 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %2, %2
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv78
  %3 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %3, %3
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond.3, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %call = tail call double @sqrt(double %add.3) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv78, i64 %indvars.iv78
  store double %call, double* %arrayidx13, align 8
  br label %for.body16

for.body42.lr.ph.us:                              ; preds = %for.body42.lr.ph.us.preheader, %for.cond33.loopexit.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.cond33.loopexit.us ], [ %indvars.iv70, %for.body42.lr.ph.us.preheader ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv78, i64 %indvars.iv72
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us, %for.body42.lr.ph.us
  %indvars.iv62 = phi i64 [ 0, %for.body42.lr.ph.us ], [ %indvars.iv.next63.1, %for.body42.us ]
  %4 = phi double [ 0.000000e+00, %for.body42.lr.ph.us ], [ %add56.us.1, %for.body42.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv62, i64 %indvars.iv78
  %5 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv62, i64 %indvars.iv72
  %6 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %5, %6
  %add56.us = fadd double %4, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next63 = or i64 %indvars.iv62, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next63, i64 %indvars.iv78
  %7 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next63, i64 %indvars.iv72
  %8 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %7, %8
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next63.1, 1000
  br i1 %exitcond65.1, label %for.body62.us.preheader, label %for.body42.us

for.body62.us.preheader:                          ; preds = %for.body42.us
  br label %for.body62.us

for.body62.us:                                    ; preds = %for.body62.us.preheader, %for.body62.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67.1, %for.body62.us ], [ 0, %for.body62.us.preheader ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv72
  %9 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv66, i64 %indvars.iv78
  %10 = load double, double* %arrayidx70.us, align 8
  %11 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %10, %11
  %sub.us = fsub double %9, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next67 = or i64 %indvars.iv66, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next67, i64 %indvars.iv72
  %12 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next67, i64 %indvars.iv78
  %13 = load double, double* %arrayidx70.us.1, align 8
  %14 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %13, %14
  %sub.us.1 = fsub double %12, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next67.1 = add nuw nsw i64 %indvars.iv66, 2
  %exitcond69.1 = icmp eq i64 %indvars.iv.next67.1, 1000
  br i1 %exitcond69.1, label %for.cond33.loopexit.us, label %for.body62.us

for.cond33.loopexit.us:                           ; preds = %for.body62.us
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond = icmp eq i64 %indvars.iv.next73, 1200
  br i1 %exitcond, label %for.end85.loopexit, label %for.body42.lr.ph.us

for.body16:                                       ; preds = %for.body16, %for.end
  %indvars.iv51 = phi i64 [ 0, %for.end ], [ %indvars.iv.next52.1, %for.body16 ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv78
  %15 = load double, double* %arrayidx20, align 8
  %16 = load double, double* %arrayidx13, align 8
  %div = fdiv double %15, %16
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv51, i64 %indvars.iv78
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next52 = or i64 %indvars.iv51, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next52, i64 %indvars.iv78
  %17 = load double, double* %arrayidx20.1, align 8
  %18 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %17, %18
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next52, i64 %indvars.iv78
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next52.1 = add nuw nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, 1000
  br i1 %exitcond54.1, label %for.body16.for.cond14.for.cond33_crit_edge_crit_edge, label %for.body16

for.body16.for.cond14.for.cond33_crit_edge_crit_edge: ; preds = %for.body16
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %cmp3416 = icmp slt i64 %indvars.iv.next79, 1200
  br i1 %cmp3416, label %for.body42.lr.ph.us.preheader, label %for.end85

for.body42.lr.ph.us.preheader:                    ; preds = %for.body16.for.cond14.for.cond33_crit_edge_crit_edge
  br label %for.body42.lr.ph.us

for.end85.loopexit:                               ; preds = %for.cond33.loopexit.us
  br label %for.end85

for.end85:                                        ; preds = %for.end85.loopexit, %for.body16.for.cond14.for.cond33_crit_edge_crit_edge
  %exitcond92 = icmp eq i64 %indvars.iv.next79, 1200
  br i1 %exitcond92, label %for.end88, label %for.end85.for.cond.for.cond1_crit_edge_crit_edge

for.end85.for.cond.for.cond1_crit_edge_crit_edge: ; preds = %for.end85
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  br label %for.cond.for.cond1_crit_edge

for.end88:                                        ; preds = %for.end85
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %R, [1200 x double]* nocapture readonly %Q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body4.lr.ph.us

for.body4.lr.ph.us:                               ; preds = %for.end.us, %entry
  %indvars.iv24 = phi i64 [ 0, %entry ], [ %indvars.iv.next25, %for.end.us ]
  %3 = mul nsw i64 %indvars.iv24, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body4.lr.ph.us
  %indvars.iv19 = phi i64 [ 0, %for.body4.lr.ph.us ], [ %indvars.iv.next20, %if.end.us ]
  %4 = add nsw i64 %indvars.iv19, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv24, i64 %indvars.iv19
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next20, 1200
  br i1 %exitcond30, label %for.end.us, label %for.body4.us

for.end.us:                                       ; preds = %if.end.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next25, 1200
  br i1 %exitcond28, label %for.end12, label %for.body4.lr.ph.us

for.end12:                                        ; preds = %for.end.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %for.body20.lr.ph.us

for.body20.lr.ph.us:                              ; preds = %for.end35.us, %for.end12
  %indvars.iv13 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next14, %for.end35.us ]
  %11 = mul nsw i64 %indvars.iv13, 1200
  br label %for.body20.us

for.body20.us:                                    ; preds = %if.end27.us, %for.body20.lr.ph.us
  %indvars.iv = phi i64 [ 0, %for.body20.lr.ph.us ], [ %indvars.iv.next, %if.end27.us ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %rem23.us = srem i32 %13, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %if.end27.us

if.then25.us:                                     ; preds = %for.body20.us
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %if.end27.us

if.end27.us:                                      ; preds = %for.body20.us, %if.then25.us
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv13, i64 %indvars.iv
  %16 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond29, label %for.end35.us, label %for.body20.us

for.end35.us:                                     ; preds = %if.end27.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond, label %for.end38, label %for.body20.lr.ph.us

for.end38:                                        ; preds = %for.end35.us
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
