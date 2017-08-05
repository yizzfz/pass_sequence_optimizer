; ModuleID = 'A.ll'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  %arraydecay7 = bitcast i8* %call4 to double*
  %arraydecay8 = bitcast i8* %call to [2000 x double]*
  tail call void @init_array(i32 2000, double* %arraydecay, double* %arraydecay5, double* %arraydecay6, double* %arraydecay7, [2000 x double]* %arraydecay8)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_mvt(i32 2000, double* %arraydecay, double* %arraydecay5, double* %arraydecay6, double* %arraydecay7, [2000 x double]* %arraydecay8)
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
  tail call void @print_array(i32 2000, double* %arraydecay, double* %arraydecay5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %n, double* nocapture %x1, double* nocapture %x2, double* nocapture %y_1, double* nocapture %y_2, [2000 x double]* nocapture %A) #2 {
entry:
  %cmp2 = icmp sgt i32 %n, 0
  br i1 %cmp2, label %for.body.lr.ph, label %for.end36

for.body.lr.ph:                                   ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %0 = zext i32 %n to i64
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp eq i32 %n, 1
  %wide.trip.count.1 = zext i32 %n to i64
  %div29.us.prol = fdiv double 0.000000e+00, %conv1
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond22.for.cond.loopexit_crit_edge.us, %for.body.lr.ph
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %for.cond22.for.cond.loopexit_crit_edge.us ], [ 0, %for.body.lr.ph ]
  %2 = trunc i64 %indvars.iv4 to i32
  %conv.us = sitofp i32 %2 to double
  %div.us = fdiv double %conv.us, %conv1
  %arrayidx.us = getelementptr inbounds double, double* %x1, i64 %indvars.iv4
  store double %div.us, double* %arrayidx.us, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %3 = icmp eq i64 %indvars.iv.next5, %0
  %4 = trunc i64 %indvars.iv.next5 to i32
  %5 = sitofp i32 %4 to double
  %conv3.us = select i1 %3, double 0.000000e+00, double %5
  %div5.us = fdiv double %conv3.us, %conv1
  %arrayidx7.us = getelementptr inbounds double, double* %x2, i64 %indvars.iv4
  store double %div5.us, double* %arrayidx7.us, align 8
  %6 = add nuw nsw i64 %indvars.iv4, 3
  %7 = trunc i64 %6 to i32
  %rem9.us = srem i32 %7, %n
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, %conv1
  %arrayidx14.us = getelementptr inbounds double, double* %y_1, i64 %indvars.iv4
  store double %div12.us, double* %arrayidx14.us, align 8
  %8 = add nuw nsw i64 %indvars.iv4, 4
  %9 = trunc i64 %8 to i32
  %rem16.us = srem i32 %9, %n
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, %conv1
  %arrayidx21.us = getelementptr inbounds double, double* %y_2, i64 %indvars.iv4
  store double %div19.us, double* %arrayidx21.us, align 8
  br i1 %lcmp.mod, label %for.body25.us.prol.loopexit, label %for.body25.us.prol

for.body25.us.prol:                               ; preds = %for.body.us
  %arrayidx33.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4, i64 0
  store double %div29.us.prol, double* %arrayidx33.us.prol, align 8
  br label %for.body25.us.prol.loopexit

for.body25.us.prol.loopexit:                      ; preds = %for.body25.us.prol, %for.body.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body25.us.prol ], [ 0, %for.body.us ]
  br i1 %1, label %for.cond22.for.cond.loopexit_crit_edge.us, label %for.body25.us.preheader

for.body25.us.preheader:                          ; preds = %for.body25.us.prol.loopexit
  br label %for.body25.us

for.body25.us:                                    ; preds = %for.body25.us.preheader, %for.body25.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body25.us ], [ %indvars.iv.unr.ph, %for.body25.us.preheader ]
  %10 = mul nuw nsw i64 %indvars.iv, %indvars.iv4
  %11 = trunc i64 %10 to i32
  %rem26.us = srem i32 %11, %n
  %conv27.us = sitofp i32 %rem26.us to double
  %div29.us = fdiv double %conv27.us, %conv1
  %arrayidx33.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv
  store double %div29.us, double* %arrayidx33.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv4
  %13 = trunc i64 %12 to i32
  %rem26.us.1 = srem i32 %13, %n
  %conv27.us.1 = sitofp i32 %rem26.us.1 to double
  %div29.us.1 = fdiv double %conv27.us.1, %conv1
  %arrayidx33.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv.next
  store double %div29.us.1, double* %arrayidx33.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond22.for.cond.loopexit_crit_edge.us.loopexit, label %for.body25.us

for.cond22.for.cond.loopexit_crit_edge.us.loopexit: ; preds = %for.body25.us
  br label %for.cond22.for.cond.loopexit_crit_edge.us

for.cond22.for.cond.loopexit_crit_edge.us:        ; preds = %for.cond22.for.cond.loopexit_crit_edge.us.loopexit, %for.body25.us.prol.loopexit
  %exitcond9 = icmp eq i64 %indvars.iv.next5, %0
  br i1 %exitcond9, label %for.end36.loopexit, label %for.body.us

for.end36.loopexit:                               ; preds = %for.cond22.for.cond.loopexit_crit_edge.us
  br label %for.end36

for.end36:                                        ; preds = %for.end36.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_mvt(i32 %n, double* nocapture %x1, double* nocapture %x2, double* nocapture readonly %y_1, double* nocapture readonly %y_2, [2000 x double]* nocapture readonly %A) #2 {
entry:
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond1.preheader.us.preheader, label %for.end38

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %0 = zext i32 %n to i64
  %xtraiter12 = and i32 %n, 1
  %lcmp.mod13 = icmp eq i32 %xtraiter12, 0
  %1 = icmp eq i32 %n, 1
  %wide.trip.count10.1 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.end_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next15, %for.cond1.for.end_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds double, double* %x1, i64 %indvars.iv14
  br i1 %lcmp.mod13, label %for.body3.us.prol.loopexit, label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.cond1.preheader.us
  %2 = load double, double* %arrayidx.us, align 8
  %arrayidx7.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv14, i64 0
  %3 = load double, double* %arrayidx7.us.prol, align 8
  %4 = load double, double* %y_1, align 8
  %mul.us.prol = fmul double %3, %4
  %add.us.prol = fadd double %2, %mul.us.prol
  store double %add.us.prol, double* %arrayidx.us, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.cond1.preheader.us
  %indvars.iv8.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.cond1.preheader.us ]
  br i1 %1, label %for.cond1.for.end_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv8 = phi i64 [ %indvars.iv.next9.1, %for.body3.us ], [ %indvars.iv8.unr.ph, %for.body3.us.preheader ]
  %5 = load double, double* %arrayidx.us, align 8
  %arrayidx7.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv8
  %6 = load double, double* %arrayidx7.us, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %y_1, i64 %indvars.iv8
  %7 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %6, %7
  %add.us = fadd double %5, %mul.us
  store double %add.us, double* %arrayidx.us, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %arrayidx7.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv.next9
  %8 = load double, double* %arrayidx7.us.1, align 8
  %arrayidx9.us.1 = getelementptr inbounds double, double* %y_1, i64 %indvars.iv.next9
  %9 = load double, double* %arrayidx9.us.1, align 8
  %mul.us.1 = fmul double %8, %9
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %arrayidx.us, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv8, 2
  %exitcond11.1 = icmp eq i64 %indvars.iv.next9.1, %wide.trip.count10.1
  br i1 %exitcond11.1, label %for.cond1.for.end_crit_edge.us.loopexit, label %for.body3.us

for.cond1.for.end_crit_edge.us.loopexit:          ; preds = %for.body3.us
  br label %for.cond1.for.end_crit_edge.us

for.cond1.for.end_crit_edge.us:                   ; preds = %for.cond1.for.end_crit_edge.us.loopexit, %for.body3.us.prol.loopexit
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, %0
  br i1 %exitcond, label %for.cond15.preheader, label %for.cond1.preheader.us

for.cond15.preheader:                             ; preds = %for.cond1.for.end_crit_edge.us
  %cmp162 = icmp sgt i32 %n, 0
  br i1 %cmp162, label %for.cond18.preheader.us.preheader, label %for.end38

for.cond18.preheader.us.preheader:                ; preds = %for.cond15.preheader
  %10 = zext i32 %n to i64
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %11 = icmp eq i32 %n, 1
  %wide.trip.count.1 = zext i32 %n to i64
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.for.end35_crit_edge.us, %for.cond18.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %for.cond18.preheader.us.preheader ], [ %indvars.iv.next6, %for.cond18.for.end35_crit_edge.us ]
  %arrayidx22.us = getelementptr inbounds double, double* %x2, i64 %indvars.iv5
  br i1 %lcmp.mod, label %for.body20.us.prol.loopexit, label %for.body20.us.prol

for.body20.us.prol:                               ; preds = %for.cond18.preheader.us
  %12 = load double, double* %arrayidx22.us, align 8
  %arrayidx26.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv5
  %13 = load double, double* %arrayidx26.us.prol, align 8
  %14 = load double, double* %y_2, align 8
  %mul29.us.prol = fmul double %13, %14
  %add30.us.prol = fadd double %12, %mul29.us.prol
  store double %add30.us.prol, double* %arrayidx22.us, align 8
  br label %for.body20.us.prol.loopexit

for.body20.us.prol.loopexit:                      ; preds = %for.body20.us.prol, %for.cond18.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body20.us.prol ], [ 0, %for.cond18.preheader.us ]
  br i1 %11, label %for.cond18.for.end35_crit_edge.us, label %for.body20.us.preheader

for.body20.us.preheader:                          ; preds = %for.body20.us.prol.loopexit
  br label %for.body20.us

for.body20.us:                                    ; preds = %for.body20.us.preheader, %for.body20.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body20.us ], [ %indvars.iv.unr.ph, %for.body20.us.preheader ]
  %15 = load double, double* %arrayidx22.us, align 8
  %arrayidx26.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv5
  %16 = load double, double* %arrayidx26.us, align 8
  %arrayidx28.us = getelementptr inbounds double, double* %y_2, i64 %indvars.iv
  %17 = load double, double* %arrayidx28.us, align 8
  %mul29.us = fmul double %16, %17
  %add30.us = fadd double %15, %mul29.us
  store double %add30.us, double* %arrayidx22.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx26.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv5
  %18 = load double, double* %arrayidx26.us.1, align 8
  %arrayidx28.us.1 = getelementptr inbounds double, double* %y_2, i64 %indvars.iv.next
  %19 = load double, double* %arrayidx28.us.1, align 8
  %mul29.us.1 = fmul double %18, %19
  %add30.us.1 = fadd double %add30.us, %mul29.us.1
  store double %add30.us.1, double* %arrayidx22.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond18.for.end35_crit_edge.us.loopexit, label %for.body20.us

for.cond18.for.end35_crit_edge.us.loopexit:       ; preds = %for.body20.us
  br label %for.cond18.for.end35_crit_edge.us

for.cond18.for.end35_crit_edge.us:                ; preds = %for.cond18.for.end35_crit_edge.us.loopexit, %for.body20.us.prol.loopexit
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next6, %10
  br i1 %exitcond18, label %for.end38.loopexit, label %for.cond18.preheader.us

for.end38.loopexit:                               ; preds = %for.cond18.for.end35_crit_edge.us
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %entry, %for.cond15.preheader
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, double* nocapture readonly %x1, double* nocapture readonly %x2) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp5 = icmp sgt i32 %n, 0
  br i1 %cmp5, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %3 = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.preheader
  %indvars.iv6 = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next7, %if.end ]
  %4 = trunc i64 %indvars.iv6 to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x1, i64 %indvars.iv6
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #5
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, %3
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  %cmp84 = icmp sgt i32 %n, 0
  br i1 %cmp84, label %for.body9.preheader, label %for.end20

for.body9.preheader:                              ; preds = %for.end
  %10 = zext i32 %n to i64
  br label %for.body9

for.body9:                                        ; preds = %if.end14, %for.body9.preheader
  %indvars.iv = phi i64 [ 0, %for.body9.preheader ], [ %indvars.iv.next, %if.end14 ]
  %11 = trunc i64 %indvars.iv to i32
  %rem10 = srem i32 %11, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %for.body9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %if.end14

if.end14:                                         ; preds = %for.body9, %if.then12
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %x2, i64 %indvars.iv
  %14 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next, %10
  br i1 %exitcond10, label %for.end20.loopexit, label %for.body9

for.end20.loopexit:                               ; preds = %if.end14
  br label %for.end20

for.end20:                                        ; preds = %for.end20.loopexit, %for.end
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
