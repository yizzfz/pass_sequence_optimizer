; ModuleID = 'A.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #5
  %call1 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #5
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #5
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #5
  %call4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #5
  %arraydecay = bitcast i8* %call to [1900 x double]*
  %arraydecay5 = bitcast i8* %call4 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call void @init_array(i32 1900, i32 2100, [1900 x double]* %arraydecay, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #5
  %arraydecay8 = bitcast i8* %call1 to double*
  %arraydecay9 = bitcast i8* %call2 to double*
  tail call void @kernel_bicg(i32 1900, i32 2100, [1900 x double]* %arraydecay, double* %arraydecay8, double* %arraydecay9, double* %arraydecay6, double* %arraydecay5)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call void @print_array(i32 1900, i32 2100, double* %arraydecay8, double* %arraydecay9)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #5
  tail call void @free(i8* %call1) #5
  tail call void @free(i8* %call2) #5
  tail call void @free(i8* %call3) #5
  tail call void @free(i8* %call4) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, [1900 x double]* nocapture %A, double* nocapture %r, double* nocapture %p) #2 {
entry:
  %0 = sext i32 %m to i64
  %cmp11 = icmp sgt i32 %m, 0
  br i1 %cmp11, label %for.body.lr.ph, label %for.cond2.preheader

for.body.lr.ph:                                   ; preds = %entry
  %conv1 = sitofp i32 %m to double
  %xtraiter22 = and i64 %0, 1
  %lcmp.mod23 = icmp eq i64 %xtraiter22, 0
  br i1 %lcmp.mod23, label %for.body.prol.loopexit, label %for.body.prol.preheader

for.body.prol.preheader:                          ; preds = %for.body.lr.ph
  %div.prol = fdiv double 0.000000e+00, %conv1
  store double %div.prol, double* %p, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.lr.ph, %for.body.prol.preheader
  %indvars.iv412.unr = phi i64 [ 0, %for.body.lr.ph ], [ 1, %for.body.prol.preheader ]
  %1 = icmp eq i32 %m, 1
  br i1 %1, label %for.cond2.preheader.loopexit, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.prol.loopexit
  br label %for.body

for.cond2.preheader.loopexit.unr-lcssa:           ; preds = %for.body
  br label %for.cond2.preheader.loopexit

for.cond2.preheader.loopexit:                     ; preds = %for.body.prol.loopexit, %for.cond2.preheader.loopexit.unr-lcssa
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.cond2.preheader.loopexit, %entry
  %2 = sext i32 %n to i64
  %cmp38 = icmp sgt i32 %n, 0
  br i1 %cmp38, label %for.body5.lr.ph, label %for.end29

for.body5.lr.ph:                                  ; preds = %for.cond2.preheader
  %conv8 = sitofp i32 %n to double
  br i1 %cmp11, label %for.body5.us.preheader, label %for.body5.preheader

for.body5.preheader:                              ; preds = %for.body5.lr.ph
  %xtraiter20 = and i64 %2, 1
  %lcmp.mod21 = icmp eq i64 %xtraiter20, 0
  br i1 %lcmp.mod21, label %for.body5.prol.loopexit, label %for.body5.prol.preheader

for.body5.prol.preheader:                         ; preds = %for.body5.preheader
  %div9.prol = fdiv double 0.000000e+00, %conv8
  store double %div9.prol, double* %r, align 8
  br label %for.body5.prol.loopexit

for.body5.prol.loopexit:                          ; preds = %for.body5.preheader, %for.body5.prol.preheader
  %indvars.iv29.unr = phi i64 [ 0, %for.body5.preheader ], [ 1, %for.body5.prol.preheader ]
  %3 = icmp eq i32 %n, 1
  br i1 %3, label %for.end29.loopexit19, label %for.body5.preheader.new

for.body5.preheader.new:                          ; preds = %for.body5.prol.loopexit
  br label %for.body5

for.body5.us.preheader:                           ; preds = %for.body5.lr.ph
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %4 = icmp eq i32 %m, 1
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.body5.us.preheader, %for.cond12.for.inc27_crit_edge.us
  %indvars.iv29.us = phi i64 [ %indvars.iv.next3.us, %for.cond12.for.inc27_crit_edge.us ], [ 0, %for.body5.us.preheader ]
  %5 = trunc i64 %indvars.iv29.us to i32
  %rem6.us = srem i32 %5, %n
  %conv7.us = sitofp i32 %rem6.us to double
  %div9.us = fdiv double %conv7.us, %conv8
  %arrayidx11.us = getelementptr inbounds double, double* %r, i64 %indvars.iv29.us
  store double %div9.us, double* %arrayidx11.us, align 8
  br i1 %lcmp.mod, label %for.body15.us.prol.loopexit.unr-lcssa, label %for.body15.us.prol.preheader

for.body15.us.prol.preheader:                     ; preds = %for.body5.us
  %arrayidx23.us.prol = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv29.us, i64 0
  store double %div9.us, double* %arrayidx23.us.prol, align 8
  br label %for.body15.us.prol.loopexit.unr-lcssa

for.body15.us.prol.loopexit.unr-lcssa:            ; preds = %for.body5.us, %for.body15.us.prol.preheader
  %indvars.iv7.us.unr.ph = phi i64 [ 1, %for.body15.us.prol.preheader ], [ 0, %for.body5.us ]
  br i1 %4, label %for.cond12.for.inc27_crit_edge.us, label %for.body5.us.new

for.body5.us.new:                                 ; preds = %for.body15.us.prol.loopexit.unr-lcssa
  br label %for.body15.us

for.body15.us:                                    ; preds = %for.body15.us, %for.body5.us.new
  %indvars.iv7.us = phi i64 [ %indvars.iv7.us.unr.ph, %for.body5.us.new ], [ %indvars.iv.next.us.1, %for.body15.us ]
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv7.us, 1
  %6 = mul nuw nsw i64 %indvars.iv.next.us, %indvars.iv29.us
  %7 = trunc i64 %6 to i32
  %rem16.us = srem i32 %7, %n
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, %conv8
  %arrayidx23.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv29.us, i64 %indvars.iv7.us
  store double %div19.us, double* %arrayidx23.us, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv7.us, 2
  %8 = mul nuw nsw i64 %indvars.iv.next.us.1, %indvars.iv29.us
  %9 = trunc i64 %8 to i32
  %rem16.us.1 = srem i32 %9, %n
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.1 = fdiv double %conv17.us.1, %conv8
  %arrayidx23.us.1 = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv29.us, i64 %indvars.iv.next.us
  store double %div19.us.1, double* %arrayidx23.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, %0
  br i1 %exitcond.1, label %for.cond12.for.inc27_crit_edge.us.unr-lcssa, label %for.body15.us

for.cond12.for.inc27_crit_edge.us.unr-lcssa:      ; preds = %for.body15.us
  br label %for.cond12.for.inc27_crit_edge.us

for.cond12.for.inc27_crit_edge.us:                ; preds = %for.body15.us.prol.loopexit.unr-lcssa, %for.cond12.for.inc27_crit_edge.us.unr-lcssa
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv29.us, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next3.us, %2
  br i1 %exitcond14, label %for.end29.loopexit, label %for.body5.us

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %indvars.iv412 = phi i64 [ %indvars.iv412.unr, %for.body.lr.ph.new ], [ %indvars.iv.next5.1, %for.body ]
  %10 = trunc i64 %indvars.iv412 to i32
  %rem = srem i32 %10, %m
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv1
  %arrayidx = getelementptr inbounds double, double* %p, i64 %indvars.iv412
  store double %div, double* %arrayidx, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv412, 1
  %11 = trunc i64 %indvars.iv.next5 to i32
  %rem.1 = srem i32 %11, %m
  %conv.1 = sitofp i32 %rem.1 to double
  %div.1 = fdiv double %conv.1, %conv1
  %arrayidx.1 = getelementptr inbounds double, double* %p, i64 %indvars.iv.next5
  store double %div.1, double* %arrayidx.1, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv412, 2
  %exitcond16.1 = icmp eq i64 %indvars.iv.next5.1, %0
  br i1 %exitcond16.1, label %for.cond2.preheader.loopexit.unr-lcssa, label %for.body

for.body5:                                        ; preds = %for.body5, %for.body5.preheader.new
  %indvars.iv29 = phi i64 [ %indvars.iv29.unr, %for.body5.preheader.new ], [ %indvars.iv.next3.1, %for.body5 ]
  %12 = trunc i64 %indvars.iv29 to i32
  %rem6 = srem i32 %12, %n
  %conv7 = sitofp i32 %rem6 to double
  %div9 = fdiv double %conv7, %conv8
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %indvars.iv29
  store double %div9, double* %arrayidx11, align 8
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv29, 1
  %13 = trunc i64 %indvars.iv.next3 to i32
  %rem6.1 = srem i32 %13, %n
  %conv7.1 = sitofp i32 %rem6.1 to double
  %div9.1 = fdiv double %conv7.1, %conv8
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next3
  store double %div9.1, double* %arrayidx11.1, align 8
  %indvars.iv.next3.1 = add nsw i64 %indvars.iv29, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next3.1, %2
  br i1 %exitcond15.1, label %for.end29.loopexit19.unr-lcssa, label %for.body5

for.end29.loopexit:                               ; preds = %for.cond12.for.inc27_crit_edge.us
  br label %for.end29

for.end29.loopexit19.unr-lcssa:                   ; preds = %for.body5
  br label %for.end29.loopexit19

for.end29.loopexit19:                             ; preds = %for.body5.prol.loopexit, %for.end29.loopexit19.unr-lcssa
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit19, %for.end29.loopexit, %for.cond2.preheader
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_bicg(i32 %m, i32 %n, [1900 x double]* nocapture readonly %A, double* nocapture %s, double* nocapture %q, double* nocapture readonly %p, double* nocapture readonly %r) #2 {
entry:
  %q16 = bitcast double* %q to i8*
  %cmp10 = icmp sgt i32 %m, 0
  br i1 %cmp10, label %for.cond1.preheader.loopexit, label %entry.for.cond1.preheader_crit_edge

entry.for.cond1.preheader_crit_edge:              ; preds = %entry
  %.pre = sext i32 %m to i64
  br label %for.cond1.preheader

for.cond1.preheader.loopexit:                     ; preds = %entry
  %0 = sext i32 %m to i64
  %s18 = bitcast double* %s to i8*
  %1 = shl nsw i64 %0, 3
  call void @llvm.memset.p0i8.i64(i8* %s18, i8 0, i64 %1, i32 8, i1 false)
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry.for.cond1.preheader_crit_edge, %for.cond1.preheader.loopexit
  %.pre-phi = phi i64 [ %.pre, %entry.for.cond1.preheader_crit_edge ], [ %0, %for.cond1.preheader.loopexit ]
  %2 = sext i32 %n to i64
  %cmp27 = icmp sgt i32 %n, 0
  br i1 %cmp27, label %for.body3.lr.ph, label %for.end36

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br i1 %cmp10, label %for.body3.us.preheader, label %for.end36.loopexit12

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.cond6.for.inc34_crit_edge.us
  %indvars.iv18.us = phi i64 [ %indvars.iv.next2.us, %for.cond6.for.inc34_crit_edge.us ], [ 0, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds double, double* %q, i64 %indvars.iv18.us
  store double 0.000000e+00, double* %arrayidx5.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %r, i64 %indvars.iv18.us
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.body8.us, %for.body3.us
  %indvars.iv6.us = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next.us, %for.body8.us ]
  %arrayidx10.us = getelementptr inbounds double, double* %s, i64 %indvars.iv6.us
  %3 = load double, double* %arrayidx10.us, align 8
  %4 = load double, double* %arrayidx12.us, align 8
  %arrayidx16.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv18.us, i64 %indvars.iv6.us
  %5 = load double, double* %arrayidx16.us, align 8
  %mul.us = fmul double %4, %5
  %add.us = fadd double %3, %mul.us
  store double %add.us, double* %arrayidx10.us, align 8
  %6 = load double, double* %arrayidx5.us, align 8
  %7 = load double, double* %arrayidx16.us, align 8
  %arrayidx26.us = getelementptr inbounds double, double* %p, i64 %indvars.iv6.us
  %8 = load double, double* %arrayidx26.us, align 8
  %mul27.us = fmul double %7, %8
  %add28.us = fadd double %6, %mul27.us
  store double %add28.us, double* %arrayidx5.us, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, %.pre-phi
  br i1 %exitcond, label %for.cond6.for.inc34_crit_edge.us, label %for.body8.us

for.cond6.for.inc34_crit_edge.us:                 ; preds = %for.body8.us
  %indvars.iv.next2.us = add nuw nsw i64 %indvars.iv18.us, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next2.us, %2
  br i1 %exitcond13, label %for.end36.loopexit, label %for.body3.us

for.end36.loopexit12:                             ; preds = %for.body3.lr.ph
  %9 = shl nsw i64 %2, 3
  call void @llvm.memset.p0i8.i64(i8* %q16, i8 0, i64 %9, i32 8, i1 false)
  br label %for.end36

for.end36.loopexit:                               ; preds = %for.cond6.for.inc34_crit_edge.us
  br label %for.end36

for.end36:                                        ; preds = %for.end36.loopexit, %for.cond1.preheader, %for.end36.loopexit12
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, double* nocapture readonly %s, double* nocapture readonly %q) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %3 = sext i32 %m to i64
  %cmp9 = icmp sgt i32 %m, 0
  br i1 %cmp9, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %if.end
  %indvars.iv410 = phi i64 [ %indvars.iv.next5, %if.end ], [ 0, %for.body.preheader ]
  %4 = trunc i64 %indvars.iv410 to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %s, i64 %indvars.iv410
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv410, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next5, %3
  br i1 %exitcond11, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %10 = sext i32 %n to i64
  %cmp86 = icmp sgt i32 %n, 0
  br i1 %cmp86, label %for.body9.preheader, label %for.end20

for.body9.preheader:                              ; preds = %for.end
  br label %for.body9

for.body9:                                        ; preds = %for.body9.preheader, %if.end14
  %indvars.iv7 = phi i64 [ %indvars.iv.next, %if.end14 ], [ 0, %for.body9.preheader ]
  %11 = trunc i64 %indvars.iv7 to i32
  %rem10 = srem i32 %11, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %for.body9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %if.end14

if.end14:                                         ; preds = %for.body9, %if.then12
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %q, i64 %indvars.iv7
  %14 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %10
  br i1 %exitcond, label %for.end20.loopexit, label %for.body9

for.end20.loopexit:                               ; preds = %if.end14
  br label %for.end20

for.end20:                                        ; preds = %for.end20.loopexit, %for.end
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
