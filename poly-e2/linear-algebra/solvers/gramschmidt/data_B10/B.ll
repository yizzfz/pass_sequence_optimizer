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
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  tail call fastcc void @init_array([1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_gramschmidt([1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call2 to [1200 x double]*
  %2 = bitcast i8* %call1 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %2, [1200 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc12_crit_edge.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.cond1.for.inc12_crit_edge.us ], [ 0, %entry ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv18 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next19, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv18, %indvars.iv25
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv18
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv25, i64 %indvars.iv18
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next19, 1200
  br i1 %exitcond22, label %for.cond1.for.inc12_crit_edge.us, label %for.inc.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 1000
  br i1 %exitcond28, label %for.cond19.preheader.us.preheader, label %for.cond1.preheader.us

for.cond19.preheader.us.preheader:                ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.preheader.us, %for.cond19.preheader.us.preheader
  %indvars.iv = phi i64 [ 0, %for.cond19.preheader.us.preheader ], [ %indvars.iv.next.7, %for.cond19.preheader.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 0
  %scevgep17 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next = or i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next, i64 0
  %scevgep17.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1, i64 0
  %scevgep17.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2, i64 0
  %scevgep17.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %scevgep.4 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.3, i64 0
  %scevgep17.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.4, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %scevgep.5 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.4, i64 0
  %scevgep17.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.5, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %scevgep.6 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.5, i64 0
  %scevgep17.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.6, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %scevgep.7 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.6, i64 0
  %scevgep17.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.7, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %for.end32, label %for.cond19.preheader.us

for.end32:                                        ; preds = %for.cond19.preheader.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc86, %entry
  %indvars.iv108 = phi i64 [ 0, %entry ], [ %0, %for.inc86 ]
  %indvars.iv99 = phi i64 [ 1, %entry ], [ %indvars.iv.next100, %for.inc86 ]
  %0 = add nuw nsw i64 %indvars.iv108, 1
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next.4, %for.inc ]
  %add8 = phi double [ 0.000000e+00, %for.body ], [ %add.4, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv108
  %1 = load double, double* %arrayidx5, align 8
  %mul = fmul double %1, %1
  %add = fadd double %add8, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv108
  %2 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %2, %2
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv108
  %3 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %3, %3
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv108
  %4 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %4, %4
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx5.4 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.3, i64 %indvars.iv108
  %5 = load double, double* %arrayidx5.4, align 8
  %mul.4 = fmul double %5, %5
  %add.4 = fadd double %add.3, %mul.4
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1000
  br i1 %exitcond.4, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %call = tail call double @sqrt(double %add.4) #3
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv108, i64 %indvars.iv108
  store double %call, double* %arrayidx13, align 8
  %arrayidx20114 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv108
  %6 = load double, double* %arrayidx20114, align 8
  %div115 = fdiv double %6, %call
  %arrayidx28116 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv108
  store double %div115, double* %arrayidx28116, align 8
  br label %for.inc29.for.inc29_crit_edge

for.inc29.for.inc29_crit_edge:                    ; preds = %for.inc29.for.inc29_crit_edge.1, %for.end
  %indvars.iv79117 = phi i64 [ 0, %for.end ], [ %indvars.iv.next80.1, %for.inc29.for.inc29_crit_edge.1 ]
  %indvars.iv.next80 = or i64 %indvars.iv79117, 1
  %.pre = load double, double* %arrayidx13, align 8
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next80, i64 %indvars.iv108
  %7 = load double, double* %arrayidx20, align 8
  %div = fdiv double %7, %.pre
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next80, i64 %indvars.iv108
  store double %div, double* %arrayidx28, align 8
  %exitcond82 = icmp eq i64 %indvars.iv.next80, 999
  br i1 %exitcond82, label %for.end31, label %for.inc29.for.inc29_crit_edge.1

for.end31:                                        ; preds = %for.inc29.for.inc29_crit_edge
  %cmp3419 = icmp slt i64 %0, 1200
  br i1 %cmp3419, label %for.body35.us.preheader, label %for.inc86

for.body35.us.preheader:                          ; preds = %for.end31
  %arrayidx70.us119 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv108
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.body35.us.preheader, %for.inc83.us
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %for.inc83.us ], [ %indvars.iv99, %for.body35.us.preheader ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv108, i64 %indvars.iv101
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br label %for.inc57.us

for.inc83.us:                                     ; preds = %for.inc80.us.for.inc80.us_crit_edge
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next102, 1200
  br i1 %exitcond104, label %for.inc86.loopexit, label %for.body35.us

for.inc80.us.for.inc80.us_crit_edge:              ; preds = %for.inc80.us.for.inc80.us_crit_edge.1, %for.inc80.us.preheader
  %indvars.iv95122 = phi i64 [ 0, %for.inc80.us.preheader ], [ %indvars.iv.next96.1, %for.inc80.us.for.inc80.us_crit_edge.1 ]
  %indvars.iv.next96 = or i64 %indvars.iv95122, 1
  %.pre76 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next96, i64 %indvars.iv101
  %8 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next96, i64 %indvars.iv108
  %9 = load double, double* %arrayidx70.us, align 8
  %mul75.us = fmul double %9, %.pre76
  %sub.us = fsub double %8, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %exitcond98 = icmp eq i64 %indvars.iv.next96, 999
  br i1 %exitcond98, label %for.inc83.us, label %for.inc80.us.for.inc80.us_crit_edge.1

for.inc57.us:                                     ; preds = %for.inc57.us, %for.body35.us
  %indvars.iv91 = phi i64 [ 0, %for.body35.us ], [ %indvars.iv.next92.1, %for.inc57.us ]
  %10 = phi double [ 0.000000e+00, %for.body35.us ], [ %add56.us.1, %for.inc57.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv91, i64 %indvars.iv108
  %11 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv101
  %12 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %11, %12
  %add56.us = fadd double %mul51.us, %10
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next92 = or i64 %indvars.iv91, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next92, i64 %indvars.iv108
  %13 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next92, i64 %indvars.iv101
  %14 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %13, %14
  %add56.us.1 = fadd double %mul51.us.1, %add56.us
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next92.1 = add nsw i64 %indvars.iv91, 2
  %exitcond94.1 = icmp eq i64 %indvars.iv.next92.1, 1000
  br i1 %exitcond94.1, label %for.inc80.us.preheader, label %for.inc57.us

for.inc80.us.preheader:                           ; preds = %for.inc57.us
  %arrayidx66.us118 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv101
  %15 = load double, double* %arrayidx66.us118, align 8
  %16 = load double, double* %arrayidx70.us119, align 8
  %mul75.us120 = fmul double %16, %add56.us.1
  %sub.us121 = fsub double %15, %mul75.us120
  store double %sub.us121, double* %arrayidx66.us118, align 8
  br label %for.inc80.us.for.inc80.us_crit_edge

for.inc86.loopexit:                               ; preds = %for.inc83.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit, %for.end31
  %exitcond111 = icmp eq i64 %0, 1200
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  br i1 %exitcond111, label %for.end88, label %for.body

for.end88:                                        ; preds = %for.inc86
  ret void

for.inc29.for.inc29_crit_edge.1:                  ; preds = %for.inc29.for.inc29_crit_edge
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79117, 2
  %.pre.1 = load double, double* %arrayidx13, align 8
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next80.1, i64 %indvars.iv108
  %17 = load double, double* %arrayidx20.1, align 8
  %div.1 = fdiv double %17, %.pre.1
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next80.1, i64 %indvars.iv108
  store double %div.1, double* %arrayidx28.1, align 8
  br label %for.inc29.for.inc29_crit_edge

for.inc80.us.for.inc80.us_crit_edge.1:            ; preds = %for.inc80.us.for.inc80.us_crit_edge
  %indvars.iv.next96.1 = add nsw i64 %indvars.iv95122, 2
  %.pre76.1 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next96.1, i64 %indvars.iv101
  %18 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next96.1, i64 %indvars.iv108
  %19 = load double, double* %arrayidx70.us.1, align 8
  %mul75.us.1 = fmul double %19, %.pre76.1
  %sub.us.1 = fsub double %18, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  br label %for.inc80.us.for.inc80.us_crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %R, [1200 x double]* nocapture readonly %Q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv34 = phi i64 [ 0, %entry ], [ %indvars.iv.next35, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv34, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv29 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next30, %for.inc.us ]
  %4 = add nsw i64 %3, %indvars.iv29
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv34, i64 %indvars.iv29
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next30, 1200
  br i1 %exitcond33, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next35, %indvars.iv.next30
  br i1 %exitcond38, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.for.inc36_crit_edge.us, %for.end12
  %indvars.iv23 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next24, %for.cond18.for.inc36_crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv23, 1200
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.body20.us, %if.then25.us
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv23, i64 %indvars.iv
  %16 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond18.for.inc36_crit_edge.us, label %for.body20.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %for.inc33.us
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next24, 1000
  br i1 %exitcond27, label %for.end38, label %for.cond18.preheader.us

for.end38:                                        ; preds = %for.cond18.for.inc36_crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
