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

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
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
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.lr.ph, label %for.end36

for.body.lr.ph:                                   ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %0 = zext i32 %n to i64
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp eq i32 %n, 1
  %wide.trip.count10 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  %div29.us.prol = fdiv double 0.000000e+00, %conv1
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond22.for.cond.loopexit_crit_edge.us, %for.body.lr.ph
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %for.cond22.for.cond.loopexit_crit_edge.us ], [ 0, %for.body.lr.ph ]
  %2 = trunc i64 %indvars.iv6 to i32
  %conv.us = sitofp i32 %2 to double
  %div.us = fdiv double %conv.us, %conv1
  %arrayidx.us = getelementptr inbounds double, double* %x1, i64 %indvars.iv6
  store double %div.us, double* %arrayidx.us, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %3 = icmp eq i64 %indvars.iv.next7, %0
  %4 = trunc i64 %indvars.iv.next7 to i32
  %5 = sitofp i32 %4 to double
  %conv3.us = select i1 %3, double 0.000000e+00, double %5
  %div5.us = fdiv double %conv3.us, %conv1
  %arrayidx7.us = getelementptr inbounds double, double* %x2, i64 %indvars.iv6
  store double %div5.us, double* %arrayidx7.us, align 8
  %6 = add nuw nsw i64 %indvars.iv6, 3
  %7 = trunc i64 %6 to i32
  %rem9.us = srem i32 %7, %n
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, %conv1
  %arrayidx14.us = getelementptr inbounds double, double* %y_1, i64 %indvars.iv6
  store double %div12.us, double* %arrayidx14.us, align 8
  %8 = add nuw nsw i64 %indvars.iv6, 4
  %9 = trunc i64 %8 to i32
  %rem16.us = srem i32 %9, %n
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, %conv1
  %arrayidx21.us = getelementptr inbounds double, double* %y_2, i64 %indvars.iv6
  store double %div19.us, double* %arrayidx21.us, align 8
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.body.us
  %arrayidx33.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 0
  store double %div29.us.prol, double* %arrayidx33.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.body.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.prol ], [ 0, %for.body.us ]
  br i1 %1, label %for.cond22.for.cond.loopexit_crit_edge.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us ], [ %indvars.iv.unr.ph, %for.inc.us.preheader ]
  %10 = mul nuw nsw i64 %indvars.iv, %indvars.iv6
  %11 = trunc i64 %10 to i32
  %rem26.us = srem i32 %11, %n
  %conv27.us = sitofp i32 %rem26.us to double
  %div29.us = fdiv double %conv27.us, %conv1
  %arrayidx33.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv
  store double %div29.us, double* %arrayidx33.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv6
  %13 = trunc i64 %12 to i32
  %rem26.us.1 = srem i32 %13, %n
  %conv27.us.1 = sitofp i32 %rem26.us.1 to double
  %div29.us.1 = fdiv double %conv27.us.1, %conv1
  %arrayidx33.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %div29.us.1, double* %arrayidx33.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond22.for.cond.loopexit_crit_edge.us.loopexit, label %for.inc.us

for.cond22.for.cond.loopexit_crit_edge.us.loopexit: ; preds = %for.inc.us
  br label %for.cond22.for.cond.loopexit_crit_edge.us

for.cond22.for.cond.loopexit_crit_edge.us:        ; preds = %for.cond22.for.cond.loopexit_crit_edge.us.loopexit, %for.inc.us.prol.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next7, %wide.trip.count10
  br i1 %exitcond, label %for.end36.loopexit, label %for.body.us

for.end36.loopexit:                               ; preds = %for.cond22.for.cond.loopexit_crit_edge.us
  br label %for.end36

for.end36:                                        ; preds = %for.end36.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_mvt(i32 %n, double* nocapture %x1, double* nocapture %x2, double* nocapture readonly %y_1, double* nocapture readonly %y_2, [2000 x double]* nocapture readonly %A) #2 {
entry:
  %cmp7 = icmp sgt i32 %n, 0
  br i1 %cmp7, label %for.cond1.preheader.us.preheader, label %for.end38

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %xtraiter16 = and i32 %n, 1
  %lcmp.mod17 = icmp eq i32 %xtraiter16, 0
  %0 = icmp eq i32 %n, 1
  %wide.trip.count20 = zext i32 %n to i64
  %wide.trip.count14.1 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc12_crit_edge.us
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %for.cond1.for.inc12_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %arrayidx.us = getelementptr inbounds double, double* %x1, i64 %indvars.iv18
  br i1 %lcmp.mod17, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.cond1.preheader.us
  %1 = load double, double* %arrayidx.us, align 8
  %arrayidx7.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv18, i64 0
  %2 = load double, double* %arrayidx7.us.prol, align 8
  %3 = load double, double* %y_1, align 8
  %mul.us.prol = fmul double %2, %3
  %add.us.prol = fadd double %1, %mul.us.prol
  store double %add.us.prol, double* %arrayidx.us, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.cond1.preheader.us
  %indvars.iv12.unr.ph = phi i64 [ 1, %for.inc.us.prol ], [ 0, %for.cond1.preheader.us ]
  br i1 %0, label %for.cond1.for.inc12_crit_edge.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv12 = phi i64 [ %indvars.iv.next13.1, %for.inc.us ], [ %indvars.iv12.unr.ph, %for.inc.us.preheader ]
  %4 = load double, double* %arrayidx.us, align 8
  %arrayidx7.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv12
  %5 = load double, double* %arrayidx7.us, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %y_1, i64 %indvars.iv12
  %6 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %5, %6
  %add.us = fadd double %4, %mul.us
  store double %add.us, double* %arrayidx.us, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %arrayidx7.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv.next13
  %7 = load double, double* %arrayidx7.us.1, align 8
  %arrayidx9.us.1 = getelementptr inbounds double, double* %y_1, i64 %indvars.iv.next13
  %8 = load double, double* %arrayidx9.us.1, align 8
  %mul.us.1 = fmul double %7, %8
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %arrayidx.us, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next13.1, %wide.trip.count14.1
  br i1 %exitcond15.1, label %for.cond1.for.inc12_crit_edge.us.loopexit, label %for.inc.us

for.cond1.for.inc12_crit_edge.us.loopexit:        ; preds = %for.inc.us
  br label %for.cond1.for.inc12_crit_edge.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.cond1.for.inc12_crit_edge.us.loopexit, %for.inc.us.prol.loopexit
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond21, label %for.cond15.preheader, label %for.cond1.preheader.us

for.cond15.preheader:                             ; preds = %for.cond1.for.inc12_crit_edge.us
  %cmp163 = icmp sgt i32 %n, 0
  br i1 %cmp163, label %for.cond18.preheader.us.preheader, label %for.end38

for.cond18.preheader.us.preheader:                ; preds = %for.cond15.preheader
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %9 = icmp eq i32 %n, 1
  %wide.trip.count11 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.preheader.us.preheader, %for.cond18.for.inc36_crit_edge.us
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.cond18.for.inc36_crit_edge.us ], [ 0, %for.cond18.preheader.us.preheader ]
  %arrayidx22.us = getelementptr inbounds double, double* %x2, i64 %indvars.iv9
  br i1 %lcmp.mod, label %for.inc33.us.prol.loopexit, label %for.inc33.us.prol

for.inc33.us.prol:                                ; preds = %for.cond18.preheader.us
  %10 = load double, double* %arrayidx22.us, align 8
  %arrayidx26.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv9
  %11 = load double, double* %arrayidx26.us.prol, align 8
  %12 = load double, double* %y_2, align 8
  %mul29.us.prol = fmul double %11, %12
  %add30.us.prol = fadd double %10, %mul29.us.prol
  store double %add30.us.prol, double* %arrayidx22.us, align 8
  br label %for.inc33.us.prol.loopexit

for.inc33.us.prol.loopexit:                       ; preds = %for.inc33.us.prol, %for.cond18.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc33.us.prol ], [ 0, %for.cond18.preheader.us ]
  br i1 %9, label %for.cond18.for.inc36_crit_edge.us, label %for.inc33.us.preheader

for.inc33.us.preheader:                           ; preds = %for.inc33.us.prol.loopexit
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.inc33.us.preheader, %for.inc33.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc33.us ], [ %indvars.iv.unr.ph, %for.inc33.us.preheader ]
  %13 = load double, double* %arrayidx22.us, align 8
  %arrayidx26.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv9
  %14 = load double, double* %arrayidx26.us, align 8
  %arrayidx28.us = getelementptr inbounds double, double* %y_2, i64 %indvars.iv
  %15 = load double, double* %arrayidx28.us, align 8
  %mul29.us = fmul double %14, %15
  %add30.us = fadd double %13, %mul29.us
  store double %add30.us, double* %arrayidx22.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx26.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv9
  %16 = load double, double* %arrayidx26.us.1, align 8
  %arrayidx28.us.1 = getelementptr inbounds double, double* %y_2, i64 %indvars.iv.next
  %17 = load double, double* %arrayidx28.us.1, align 8
  %mul29.us.1 = fmul double %16, %17
  %add30.us.1 = fadd double %add30.us, %mul29.us.1
  store double %add30.us.1, double* %arrayidx22.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond18.for.inc36_crit_edge.us.loopexit, label %for.inc33.us

for.cond18.for.inc36_crit_edge.us.loopexit:       ; preds = %for.inc33.us
  br label %for.cond18.for.inc36_crit_edge.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %for.cond18.for.inc36_crit_edge.us.loopexit, %for.inc33.us.prol.loopexit
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  br i1 %exitcond, label %for.end38.loopexit, label %for.cond18.preheader.us

for.end38.loopexit:                               ; preds = %for.cond18.for.inc36_crit_edge.us
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp6 = icmp sgt i32 %n, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count10 = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.inc ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv8 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x1, i64 %indvars.iv8
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, %wide.trip.count10
  br i1 %exitcond11, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %cmp84 = icmp sgt i32 %n, 0
  br i1 %cmp84, label %for.body9.preheader, label %for.end20

for.body9.preheader:                              ; preds = %for.end
  %wide.trip.count = zext i32 %n to i64
  br label %for.body9

for.body9:                                        ; preds = %for.body9.preheader, %for.inc18
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc18 ], [ 0, %for.body9.preheader ]
  %9 = trunc i64 %indvars.iv to i32
  %rem10 = srem i32 %9, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %for.inc18

if.then12:                                        ; preds = %for.body9
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %for.inc18

for.inc18:                                        ; preds = %for.body9, %if.then12
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %x2, i64 %indvars.iv
  %12 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end20.loopexit, label %for.body9

for.end20.loopexit:                               ; preds = %for.inc18
  br label %for.end20

for.end20:                                        ; preds = %for.end20.loopexit, %for.end
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
