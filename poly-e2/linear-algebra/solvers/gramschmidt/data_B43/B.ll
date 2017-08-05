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
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #2 {
entry:
  %0 = sext i32 %n to i64
  %1 = sext i32 %m to i64
  %cmp12 = icmp sgt i32 %m, 0
  br i1 %cmp12, label %for.cond1.preheader.lr.ph, label %for.cond15.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp29 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  br i1 %cmp29, label %for.cond1.preheader.us.preheader, label %for.end32

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.inc12.loopexit.us
  %indvars.iv13.us = phi i64 [ %indvars.iv.next11.us, %for.inc12.loopexit.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv10.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next7.us, %for.inc.us ]
  %2 = mul nuw nsw i64 %indvars.iv10.us, %indvars.iv13.us
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv13.us, i64 %indvars.iv10.us
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv13.us, i64 %indvars.iv10.us
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next7.us = add nuw nsw i64 %indvars.iv10.us, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next7.us, %0
  br i1 %exitcond18, label %for.inc12.loopexit.us, label %for.inc.us

for.inc12.loopexit.us:                            ; preds = %for.inc.us
  %indvars.iv.next11.us = add nuw nsw i64 %indvars.iv13.us, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next11.us, %1
  br i1 %exitcond21, label %for.cond15.preheader.loopexit, label %for.cond1.preheader.us

for.cond15.preheader.loopexit:                    ; preds = %for.inc12.loopexit.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  %cmp164 = icmp sgt i32 %n, 0
  br i1 %cmp164, label %for.cond19.preheader.us.preheader, label %for.end32

for.cond19.preheader.us.preheader:                ; preds = %for.cond15.preheader
  %wide.trip.count = zext i32 %n to i64
  %4 = shl nuw nsw i64 %wide.trip.count, 3
  %5 = add nsw i64 %0, -1
  %xtraiter = and i64 %0, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond19.preheader.us.prol.loopexit, label %for.cond19.preheader.us.prol.preheader

for.cond19.preheader.us.prol.preheader:           ; preds = %for.cond19.preheader.us.preheader
  br label %for.cond19.preheader.us.prol

for.cond19.preheader.us.prol:                     ; preds = %for.cond19.preheader.us.prol.preheader, %for.cond19.preheader.us.prol.for.cond19.preheader.us.prol_crit_edge
  %indvars.iv5.us.prol = phi i64 [ %indvars.iv.next3.us.prol, %for.cond19.preheader.us.prol.for.cond19.preheader.us.prol_crit_edge ], [ 0, %for.cond19.preheader.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.cond19.preheader.us.prol.for.cond19.preheader.us.prol_crit_edge ], [ %xtraiter, %for.cond19.preheader.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv5.us.prol, i64 0
  %scevgep17.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.prol, i8 0, i64 %4, i32 8, i1 false)
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond19.preheader.us.prol.loopexit.loopexit, label %for.cond19.preheader.us.prol.for.cond19.preheader.us.prol_crit_edge, !llvm.loop !1

for.cond19.preheader.us.prol.for.cond19.preheader.us.prol_crit_edge: ; preds = %for.cond19.preheader.us.prol
  %indvars.iv.next3.us.prol = add nuw nsw i64 %indvars.iv5.us.prol, 1
  br label %for.cond19.preheader.us.prol

for.cond19.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond19.preheader.us.prol
  br label %for.cond19.preheader.us.prol.loopexit

for.cond19.preheader.us.prol.loopexit:            ; preds = %for.cond19.preheader.us.prol.loopexit.loopexit, %for.cond19.preheader.us.preheader
  %indvars.iv5.us.unr = phi i64 [ 0, %for.cond19.preheader.us.preheader ], [ %xtraiter, %for.cond19.preheader.us.prol.loopexit.loopexit ]
  %6 = icmp ult i64 %5, 3
  br i1 %6, label %for.end32, label %for.cond19.preheader.us.preheader26

for.cond19.preheader.us.preheader26:              ; preds = %for.cond19.preheader.us.prol.loopexit
  %7 = add nsw i64 %0, -4
  %8 = sub nsw i64 %7, %indvars.iv5.us.unr
  %9 = lshr i64 %8, 2
  %10 = and i64 %9, 1
  %lcmp.mod30 = icmp eq i64 %10, 0
  br i1 %lcmp.mod30, label %for.cond19.preheader.us.prol.preheader27, label %for.cond19.preheader.us.prol.loopexit28

for.cond19.preheader.us.prol.preheader27:         ; preds = %for.cond19.preheader.us.preheader26
  br label %for.cond19.preheader.us.prol31

for.cond19.preheader.us.prol31:                   ; preds = %for.cond19.preheader.us.prol.preheader27
  %scevgep.prol33 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv5.us.unr, i64 0
  %scevgep17.prol34 = bitcast double* %scevgep.prol33 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.prol34, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next3.us.prol35 = add nuw nsw i64 %indvars.iv5.us.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next3.us.prol35, i64 0
  %scevgep17.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.1.prol, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next3.us.1.prol = add nuw nsw i64 %indvars.iv5.us.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next3.us.1.prol, i64 0
  %scevgep17.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.2.prol, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next3.us.2.prol = add nuw nsw i64 %indvars.iv5.us.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next3.us.2.prol, i64 0
  %scevgep17.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.3.prol, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next3.us.3.prol = or i64 %indvars.iv5.us.unr, 4
  br label %for.cond19.preheader.us.prol.loopexit28

for.cond19.preheader.us.prol.loopexit28:          ; preds = %for.cond19.preheader.us.prol31, %for.cond19.preheader.us.preheader26
  %indvars.iv5.us.unr36 = phi i64 [ %indvars.iv5.us.unr, %for.cond19.preheader.us.preheader26 ], [ %indvars.iv.next3.us.3.prol, %for.cond19.preheader.us.prol31 ]
  %11 = icmp eq i64 %9, 0
  br i1 %11, label %for.end32.loopexit, label %for.cond19.preheader.us.preheader26.new

for.cond19.preheader.us.preheader26.new:          ; preds = %for.cond19.preheader.us.prol.loopexit28
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.preheader.us, %for.cond19.preheader.us.preheader26.new
  %indvars.iv5.us = phi i64 [ %indvars.iv5.us.unr36, %for.cond19.preheader.us.preheader26.new ], [ %indvars.iv.next3.us.3.1, %for.cond19.preheader.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv5.us, i64 0
  %scevgep17 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv5.us, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next3.us, i64 0
  %scevgep17.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.1, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next3.us.1 = add nsw i64 %indvars.iv5.us, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next3.us.1, i64 0
  %scevgep17.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.2, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next3.us.2 = add nsw i64 %indvars.iv5.us, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next3.us.2, i64 0
  %scevgep17.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.3, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next3.us.3 = add nsw i64 %indvars.iv5.us, 4
  %scevgep.137 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next3.us.3, i64 0
  %scevgep17.138 = bitcast double* %scevgep.137 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.138, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next3.us.139 = add nsw i64 %indvars.iv5.us, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next3.us.139, i64 0
  %scevgep17.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.1.1, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next3.us.1.1 = add nsw i64 %indvars.iv5.us, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next3.us.1.1, i64 0
  %scevgep17.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.2.1, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next3.us.2.1 = add nsw i64 %indvars.iv5.us, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next3.us.2.1, i64 0
  %scevgep17.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.3.1, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next3.us.3.1 = add nsw i64 %indvars.iv5.us, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next3.us.3.1, %0
  br i1 %exitcond.3.1, label %for.end32.loopexit.unr-lcssa, label %for.cond19.preheader.us

for.end32.loopexit.unr-lcssa:                     ; preds = %for.cond19.preheader.us
  br label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.cond19.preheader.us.prol.loopexit28, %for.end32.loopexit.unr-lcssa
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %for.cond19.preheader.us.prol.loopexit, %for.cond15.preheader, %for.cond1.preheader.lr.ph
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  %0 = sext i32 %m to i64
  %1 = sext i32 %n to i64
  %cmp22 = icmp sgt i32 %n, 0
  br i1 %cmp22, label %for.cond1.preheader.lr.ph, label %for.end88

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp21 = icmp sgt i32 %m, 0
  %2 = shl nsw i64 %1, 3
  %3 = add nsw i64 %2, -8
  %4 = add nsw i64 %0, -1
  %xtraiter = and i64 %0, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %5 = icmp ult i64 %4, 3
  %xtraiter69 = and i64 %0, 1
  %lcmp.mod70 = icmp eq i64 %xtraiter69, 0
  %6 = icmp eq i64 %4, 0
  %lcmp.mod74 = icmp ne i64 %xtraiter69, 0
  br label %for.cond1.preheader

for.cond.loopexit.loopexit:                       ; preds = %for.inc83.us
  br label %for.cond.loopexit

for.cond.loopexit:                                ; preds = %for.cond.loopexit.loopexit, %for.end31, %for.body35.preheader
  %exitcond68 = icmp eq i64 %indvars.iv.next21, %1
  br i1 %exitcond68, label %for.end88.loopexit, label %for.cond.loopexit.for.cond1.preheader_crit_edge

for.cond.loopexit.for.cond1.preheader_crit_edge:  ; preds = %for.cond.loopexit
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv, 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.loopexit.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next67, %for.cond.loopexit.for.cond1.preheader_crit_edge ]
  %indvars.iv2023 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next21, %for.cond.loopexit.for.cond1.preheader_crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv2023, 1201
  %8 = add nuw nsw i64 %7, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %8
  %scevgep57 = bitcast double* %scevgep to i8*
  %9 = mul nsw i64 %indvars.iv2023, -8
  %10 = add nsw i64 %3, %9
  br i1 %cmp21, label %for.inc.preheader, label %for.end.thread

for.end.thread:                                   ; preds = %for.cond1.preheader
  %arrayidx1378 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv2023, i64 %indvars.iv2023
  store double 0.000000e+00, double* %arrayidx1378, align 8
  br label %for.end31

for.inc.preheader:                                ; preds = %for.cond1.preheader
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol.for.inc.prol_crit_edge
  %nrm.03.prol = phi double [ %add.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0.000000e+00, %for.inc.prol.preheader ]
  %indvars.iv2.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0, %for.inc.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc.prol.for.inc.prol_crit_edge ], [ %xtraiter, %for.inc.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv2.prol, i64 %indvars.iv2023
  %11 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %11, %11
  %add.prol = fadd double %nrm.03.prol, %mul.prol
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol.for.inc.prol_crit_edge, !llvm.loop !3

for.inc.prol.for.inc.prol_crit_edge:              ; preds = %for.inc.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv2.prol, 1
  br label %for.inc.prol

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.preheader
  %nrm.03.unr = phi double [ 0.000000e+00, %for.inc.preheader ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %indvars.iv2.unr = phi i64 [ 0, %for.inc.preheader ], [ %xtraiter, %for.inc.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.inc.preheader ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  br i1 %5, label %for.end, label %for.inc.preheader86

for.inc.preheader86:                              ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader86, %for.inc
  %nrm.03 = phi double [ %add.3, %for.inc ], [ %nrm.03.unr, %for.inc.preheader86 ]
  %indvars.iv2 = phi i64 [ %indvars.iv.next.3, %for.inc ], [ %indvars.iv2.unr, %for.inc.preheader86 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv2023
  %12 = load double, double* %arrayidx5, align 8
  %mul = fmul double %12, %12
  %add = fadd double %nrm.03, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv2023
  %13 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %13, %13
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv2, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv2023
  %14 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %14, %14
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv2, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv2023
  %15 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %15, %15
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv2, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %0
  br i1 %exitcond.3, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit
  %nrm.0.lcssa = phi double [ %add.lcssa.unr, %for.inc.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %nrm.0.lcssa) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv2023, i64 %indvars.iv2023
  store double %call, double* %arrayidx13, align 8
  br i1 %lcmp.mod70, label %for.inc29.prol.loopexit.unr-lcssa, label %for.inc29.prol.preheader

for.inc29.prol.preheader:                         ; preds = %for.end
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv2023
  %16 = load double, double* %arrayidx20.prol, align 8
  %div.prol = fdiv double %16, %call
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv2023
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.inc29.prol.loopexit.unr-lcssa

for.inc29.prol.loopexit.unr-lcssa:                ; preds = %for.end, %for.inc29.prol.preheader
  %indvars.iv6.unr.ph = phi i64 [ 1, %for.inc29.prol.preheader ], [ 0, %for.end ]
  br i1 %6, label %for.end31, label %for.inc29.preheader

for.inc29.preheader:                              ; preds = %for.inc29.prol.loopexit.unr-lcssa
  br label %for.inc29

for.inc29:                                        ; preds = %for.inc29.preheader, %for.inc29
  %indvars.iv6 = phi i64 [ %indvars.iv.next4.1, %for.inc29 ], [ %indvars.iv6.unr.ph, %for.inc29.preheader ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv2023
  %17 = load double, double* %arrayidx20, align 8
  %18 = load double, double* %arrayidx13, align 8
  %div = fdiv double %17, %18
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv6, i64 %indvars.iv2023
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv6, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next4, i64 %indvars.iv2023
  %19 = load double, double* %arrayidx20.1, align 8
  %20 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %19, %20
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next4, i64 %indvars.iv2023
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next4.1 = add nuw nsw i64 %indvars.iv6, 2
  %exitcond55.1 = icmp eq i64 %indvars.iv.next4.1, %0
  br i1 %exitcond55.1, label %for.end31.loopexit, label %for.inc29

for.end31.loopexit:                               ; preds = %for.inc29
  br label %for.end31

for.end31:                                        ; preds = %for.end31.loopexit, %for.inc29.prol.loopexit.unr-lcssa, %for.end.thread
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2023, 1
  %cmp3416 = icmp slt i64 %indvars.iv, %1
  br i1 %cmp3416, label %for.body35.lr.ph, label %for.cond.loopexit

for.body35.lr.ph:                                 ; preds = %for.end31
  br i1 %cmp21, label %for.body35.us.preheader, label %for.body35.preheader

for.body35.us.preheader:                          ; preds = %for.body35.lr.ph
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv2023
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.inc83.us, %for.body35.us.preheader
  %indvars.iv1417.us = phi i64 [ %indvars.iv, %for.body35.us.preheader ], [ %indvars.iv.next15.us, %for.inc83.us ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv2023, i64 %indvars.iv1417.us
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 %lcmp.mod74, label %for.inc57.us.prol.preheader, label %for.inc57.us.prol.loopexit.unr-lcssa

for.inc57.us.prol.preheader:                      ; preds = %for.body35.us
  %21 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv1417.us
  %22 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %21, %22
  %add56.us.prol = fadd double %mul51.us.prol, 0.000000e+00
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.inc57.us.prol.loopexit.unr-lcssa

for.inc57.us.prol.loopexit.unr-lcssa:             ; preds = %for.body35.us, %for.inc57.us.prol.preheader
  %23 = phi double [ %add56.us.prol, %for.inc57.us.prol.preheader ], [ 0.000000e+00, %for.body35.us ]
  %indvars.iv9.us.unr.ph = phi i64 [ 1, %for.inc57.us.prol.preheader ], [ 0, %for.body35.us ]
  br i1 %6, label %for.inc80.us.preheader, label %for.inc57.us.preheader

for.inc57.us.preheader:                           ; preds = %for.inc57.us.prol.loopexit.unr-lcssa
  br label %for.inc57.us

for.inc57.us:                                     ; preds = %for.inc57.us.preheader, %for.inc57.us
  %24 = phi double [ %add56.us.1, %for.inc57.us ], [ %23, %for.inc57.us.preheader ]
  %indvars.iv9.us = phi i64 [ %indvars.iv.next7.us.1, %for.inc57.us ], [ %indvars.iv9.us.unr.ph, %for.inc57.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv9.us, i64 %indvars.iv2023
  %25 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv9.us, i64 %indvars.iv1417.us
  %26 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %25, %26
  %add56.us = fadd double %24, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next7.us = add nuw nsw i64 %indvars.iv9.us, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next7.us, i64 %indvars.iv2023
  %27 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next7.us, i64 %indvars.iv1417.us
  %28 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %27, %28
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next7.us.1 = add nuw nsw i64 %indvars.iv9.us, 2
  %exitcond62.1 = icmp eq i64 %indvars.iv.next7.us.1, %0
  br i1 %exitcond62.1, label %for.inc80.us.preheader.loopexit, label %for.inc57.us

for.inc80.us:                                     ; preds = %for.inc80.us.preheader85, %for.inc80.us
  %indvars.iv12.us = phi i64 [ %indvars.iv.next10.us.1, %for.inc80.us ], [ %indvars.iv12.us.unr.ph, %for.inc80.us.preheader85 ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv12.us, i64 %indvars.iv1417.us
  %29 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv12.us, i64 %indvars.iv2023
  %30 = load double, double* %arrayidx70.us, align 8
  %31 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %30, %31
  %sub.us = fsub double %29, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv12.us, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next10.us, i64 %indvars.iv1417.us
  %32 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next10.us, i64 %indvars.iv2023
  %33 = load double, double* %arrayidx70.us.1, align 8
  %34 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %33, %34
  %sub.us.1 = fsub double %32, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next10.us.1 = add nuw nsw i64 %indvars.iv12.us, 2
  %exitcond63.1 = icmp eq i64 %indvars.iv.next10.us.1, %0
  br i1 %exitcond63.1, label %for.inc83.us.loopexit, label %for.inc80.us

for.inc83.us.loopexit:                            ; preds = %for.inc80.us
  br label %for.inc83.us

for.inc83.us:                                     ; preds = %for.inc83.us.loopexit, %for.inc80.us.prol.loopexit.unr-lcssa
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv1417.us, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next15.us, %1
  br i1 %exitcond64, label %for.cond.loopexit.loopexit, label %for.body35.us

for.inc80.us.preheader.loopexit:                  ; preds = %for.inc57.us
  br label %for.inc80.us.preheader

for.inc80.us.preheader:                           ; preds = %for.inc80.us.preheader.loopexit, %for.inc57.us.prol.loopexit.unr-lcssa
  %35 = phi double [ %23, %for.inc57.us.prol.loopexit.unr-lcssa ], [ %add56.us.1, %for.inc80.us.preheader.loopexit ]
  br i1 %lcmp.mod74, label %for.inc80.us.prol.preheader, label %for.inc80.us.prol.loopexit.unr-lcssa

for.inc80.us.prol.preheader:                      ; preds = %for.inc80.us.preheader
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv1417.us
  %36 = load double, double* %arrayidx66.us.prol, align 8
  %37 = load double, double* %arrayidx46.us.prol, align 8
  %mul75.us.prol = fmul double %37, %35
  %sub.us.prol = fsub double %36, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.inc80.us.prol.loopexit.unr-lcssa

for.inc80.us.prol.loopexit.unr-lcssa:             ; preds = %for.inc80.us.preheader, %for.inc80.us.prol.preheader
  %indvars.iv12.us.unr.ph = phi i64 [ 1, %for.inc80.us.prol.preheader ], [ 0, %for.inc80.us.preheader ]
  br i1 %6, label %for.inc83.us, label %for.inc80.us.preheader85

for.inc80.us.preheader85:                         ; preds = %for.inc80.us.prol.loopexit.unr-lcssa
  br label %for.inc80.us

for.body35.preheader:                             ; preds = %for.body35.lr.ph
  call void @llvm.memset.p0i8.i64(i8* %scevgep57, i8 0, i64 %10, i32 8, i1 false)
  br label %for.cond.loopexit

for.end88.loopexit:                               ; preds = %for.cond.loopexit
  br label %for.end88

for.end88:                                        ; preds = %for.end88.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %R, [1200 x double]* nocapture readonly %Q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %3 = sext i32 %n to i64
  %cmp15 = icmp sgt i32 %n, 0
  br i1 %cmp15, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.loopexit.us, %for.cond2.preheader.us.preheader
  %indvars.iv16.us = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next13.us, %for.inc10.loopexit.us ]
  %4 = mul nsw i64 %indvars.iv16.us, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv12.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next9.us, %for.inc.us ]
  %5 = add nsw i64 %indvars.iv12.us, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv16.us, i64 %indvars.iv12.us
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv12.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next9.us, %wide.trip.count
  br i1 %exitcond.us, label %for.inc10.loopexit.us, label %for.body4.us

for.inc10.loopexit.us:                            ; preds = %for.inc.us
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv16.us, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next13.us, %3
  br i1 %exitcond22, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.inc10.loopexit.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %12 = sext i32 %m to i64
  %cmp166.not = icmp slt i32 %m, 1
  %cmp15.not = xor i1 %cmp15, true
  %brmerge = or i1 %cmp166.not, %cmp15.not
  br i1 %brmerge, label %for.end38, label %for.cond18.preheader.us.preheader

for.cond18.preheader.us.preheader:                ; preds = %for.end12
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.preheader.us.preheader, %for.inc36.loopexit.us
  %indvars.iv7.us = phi i64 [ %indvars.iv.next4.us, %for.inc36.loopexit.us ], [ 0, %for.cond18.preheader.us.preheader ]
  %13 = mul nsw i64 %indvars.iv7.us, %3
  br label %for.body20.us

for.body20.us:                                    ; preds = %for.inc33.us, %for.cond18.preheader.us
  %indvars.iv3.us = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next.us, %for.inc33.us ]
  %14 = add nsw i64 %indvars.iv3.us, %13
  %15 = trunc i64 %14 to i32
  %rem23.us = srem i32 %15, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %for.inc33.us

if.then25.us:                                     ; preds = %for.body20.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.body20.us, %if.then25.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv7.us, i64 %indvars.iv3.us
  %18 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv3.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, %3
  br i1 %exitcond, label %for.inc36.loopexit.us, label %for.body20.us

for.inc36.loopexit.us:                            ; preds = %for.inc33.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv7.us, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next4.us, %12
  br i1 %exitcond20, label %for.end38.loopexit, label %for.cond18.preheader.us

for.end38.loopexit:                               ; preds = %for.inc36.loopexit.us
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.end12
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
