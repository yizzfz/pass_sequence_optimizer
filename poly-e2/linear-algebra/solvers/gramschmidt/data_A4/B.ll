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
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
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
  %cmp17 = icmp sgt i32 %m, 0
  br i1 %cmp17, label %for.cond1.preheader.lr.ph, label %entry.for.cond15.preheader_crit_edge

entry.for.cond15.preheader_crit_edge:             ; preds = %entry
  br label %for.cond15.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp214 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  br i1 %cmp214, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.lr.ph.for.end32_crit_edge

for.cond1.preheader.lr.ph.for.end32_crit_edge:    ; preds = %for.cond1.preheader.lr.ph
  br label %for.end32

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc12_crit_edge.us.for.cond1.preheader.us_crit_edge, %for.cond1.preheader.us.preheader
  %indvars.iv718.us = phi i64 [ %indvars.iv.next8.us, %for.cond1.for.inc12_crit_edge.us.for.cond1.preheader.us_crit_edge ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.for.inc.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv315.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next4.us, %for.inc.us.for.inc.us_crit_edge ]
  %2 = mul nuw nsw i64 %indvars.iv315.us, %indvars.iv718.us
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv718.us, i64 %indvars.iv315.us
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv718.us, i64 %indvars.iv315.us
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv315.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next4.us, %0
  br i1 %exitcond, label %for.cond1.for.inc12_crit_edge.us, label %for.inc.us.for.inc.us_crit_edge

for.inc.us.for.inc.us_crit_edge:                  ; preds = %for.inc.us
  br label %for.inc.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv718.us, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next8.us, %1
  br i1 %exitcond25, label %for.cond15.preheader.loopexit, label %for.cond1.for.inc12_crit_edge.us.for.cond1.preheader.us_crit_edge

for.cond1.for.inc12_crit_edge.us.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond1.preheader.us

for.cond15.preheader.loopexit:                    ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %entry.for.cond15.preheader_crit_edge, %for.cond15.preheader.loopexit
  %cmp1611 = icmp sgt i32 %n, 0
  br i1 %cmp1611, label %for.cond19.preheader.preheader, label %for.cond15.preheader.for.end32_crit_edge

for.cond15.preheader.for.end32_crit_edge:         ; preds = %for.cond15.preheader
  br label %for.end32

for.cond19.preheader.preheader:                   ; preds = %for.cond15.preheader
  %wide.trip.count = zext i32 %n to i64
  %4 = shl nuw nsw i64 %wide.trip.count, 3
  %5 = add nsw i64 %0, -1
  %xtraiter = and i64 %0, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond19.preheader.preheader.for.cond19.preheader.prol.loopexit_crit_edge, label %for.cond19.preheader.prol.preheader

for.cond19.preheader.preheader.for.cond19.preheader.prol.loopexit_crit_edge: ; preds = %for.cond19.preheader.preheader
  br label %for.cond19.preheader.prol.loopexit

for.cond19.preheader.prol.preheader:              ; preds = %for.cond19.preheader.preheader
  br label %for.cond19.preheader.prol

for.cond19.preheader.prol:                        ; preds = %for.cond19.preheader.prol.for.cond19.preheader.prol_crit_edge, %for.cond19.preheader.prol.preheader
  %indvars.iv112.prol = phi i64 [ %indvars.iv.next2.prol, %for.cond19.preheader.prol.for.cond19.preheader.prol_crit_edge ], [ 0, %for.cond19.preheader.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.cond19.preheader.prol.for.cond19.preheader.prol_crit_edge ], [ %xtraiter, %for.cond19.preheader.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv112.prol, i64 0
  %scevgep22.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.prol, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.prol = add nuw nsw i64 %indvars.iv112.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond19.preheader.prol.loopexit.loopexit, label %for.cond19.preheader.prol.for.cond19.preheader.prol_crit_edge, !llvm.loop !1

for.cond19.preheader.prol.for.cond19.preheader.prol_crit_edge: ; preds = %for.cond19.preheader.prol
  br label %for.cond19.preheader.prol

for.cond19.preheader.prol.loopexit.loopexit:      ; preds = %for.cond19.preheader.prol
  br label %for.cond19.preheader.prol.loopexit

for.cond19.preheader.prol.loopexit:               ; preds = %for.cond19.preheader.preheader.for.cond19.preheader.prol.loopexit_crit_edge, %for.cond19.preheader.prol.loopexit.loopexit
  %indvars.iv112.unr = phi i64 [ 0, %for.cond19.preheader.preheader.for.cond19.preheader.prol.loopexit_crit_edge ], [ %indvars.iv.next2.prol, %for.cond19.preheader.prol.loopexit.loopexit ]
  %6 = icmp ult i64 %5, 3
  br i1 %6, label %for.cond19.preheader.prol.loopexit.for.end32_crit_edge, label %for.cond19.preheader.preheader30

for.cond19.preheader.prol.loopexit.for.end32_crit_edge: ; preds = %for.cond19.preheader.prol.loopexit
  br label %for.end32

for.cond19.preheader.preheader30:                 ; preds = %for.cond19.preheader.prol.loopexit
  %7 = add nsw i64 %0, -4
  %8 = sub i64 %7, %indvars.iv112.unr
  %9 = lshr i64 %8, 2
  %10 = and i64 %9, 1
  %lcmp.mod34 = icmp eq i64 %10, 0
  br i1 %lcmp.mod34, label %for.cond19.preheader.prol.preheader31, label %for.cond19.preheader.preheader30.for.cond19.preheader.prol.loopexit32_crit_edge

for.cond19.preheader.preheader30.for.cond19.preheader.prol.loopexit32_crit_edge: ; preds = %for.cond19.preheader.preheader30
  br label %for.cond19.preheader.prol.loopexit32

for.cond19.preheader.prol.preheader31:            ; preds = %for.cond19.preheader.preheader30
  br label %for.cond19.preheader.prol35

for.cond19.preheader.prol35:                      ; preds = %for.cond19.preheader.prol.preheader31
  %scevgep.prol37 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv112.unr, i64 0
  %scevgep22.prol38 = bitcast double* %scevgep.prol37 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.prol38, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.prol39 = add nuw nsw i64 %indvars.iv112.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.prol39, i64 0
  %scevgep22.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.1.prol, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.1.prol = add nsw i64 %indvars.iv112.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.1.prol, i64 0
  %scevgep22.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.2.prol, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.2.prol = add nsw i64 %indvars.iv112.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.2.prol, i64 0
  %scevgep22.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.3.prol, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.3.prol = add nsw i64 %indvars.iv112.unr, 4
  br label %for.cond19.preheader.prol.loopexit32

for.cond19.preheader.prol.loopexit32:             ; preds = %for.cond19.preheader.preheader30.for.cond19.preheader.prol.loopexit32_crit_edge, %for.cond19.preheader.prol35
  %indvars.iv112.unr40 = phi i64 [ %indvars.iv112.unr, %for.cond19.preheader.preheader30.for.cond19.preheader.prol.loopexit32_crit_edge ], [ %indvars.iv.next2.3.prol, %for.cond19.preheader.prol35 ]
  %11 = icmp eq i64 %9, 0
  br i1 %11, label %for.cond19.preheader.prol.loopexit32.for.end32.loopexit_crit_edge, label %for.cond19.preheader.preheader30.new

for.cond19.preheader.prol.loopexit32.for.end32.loopexit_crit_edge: ; preds = %for.cond19.preheader.prol.loopexit32
  br label %for.end32.loopexit

for.cond19.preheader.preheader30.new:             ; preds = %for.cond19.preheader.prol.loopexit32
  br label %for.cond19.preheader

for.cond19.preheader:                             ; preds = %for.cond19.preheader.for.cond19.preheader_crit_edge, %for.cond19.preheader.preheader30.new
  %indvars.iv112 = phi i64 [ %indvars.iv112.unr40, %for.cond19.preheader.preheader30.new ], [ %indvars.iv.next2.3.1, %for.cond19.preheader.for.cond19.preheader_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv112, i64 0
  %scevgep22 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv112, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2, i64 0
  %scevgep22.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.1, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.1 = add nsw i64 %indvars.iv112, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.1, i64 0
  %scevgep22.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.2, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.2 = add nsw i64 %indvars.iv112, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.2, i64 0
  %scevgep22.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.3, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.3 = add nsw i64 %indvars.iv112, 4
  %scevgep.141 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.3, i64 0
  %scevgep22.142 = bitcast double* %scevgep.141 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.142, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.143 = add nsw i64 %indvars.iv112, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.143, i64 0
  %scevgep22.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.1.1, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.1.1 = add nsw i64 %indvars.iv112, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.1.1, i64 0
  %scevgep22.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.2.1, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.2.1 = add nsw i64 %indvars.iv112, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.2.1, i64 0
  %scevgep22.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.3.1, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.3.1 = add nsw i64 %indvars.iv112, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next2.3.1, %0
  br i1 %exitcond.3.1, label %for.end32.loopexit.unr-lcssa, label %for.cond19.preheader.for.cond19.preheader_crit_edge

for.cond19.preheader.for.cond19.preheader_crit_edge: ; preds = %for.cond19.preheader
  br label %for.cond19.preheader

for.end32.loopexit.unr-lcssa:                     ; preds = %for.cond19.preheader
  br label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.cond19.preheader.prol.loopexit32.for.end32.loopexit_crit_edge, %for.end32.loopexit.unr-lcssa
  br label %for.end32

for.end32:                                        ; preds = %for.cond19.preheader.prol.loopexit.for.end32_crit_edge, %for.cond15.preheader.for.end32_crit_edge, %for.cond1.preheader.lr.ph.for.end32_crit_edge, %for.end32.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  %0 = sext i32 %m to i64
  %1 = sext i32 %n to i64
  %cmp52 = icmp sgt i32 %n, 0
  br i1 %cmp52, label %for.cond1.preheader.lr.ph, label %entry.for.end88_crit_edge

entry.for.end88_crit_edge:                        ; preds = %entry
  br label %for.end88

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %2 = add i32 %n, -1
  %cmp213 = icmp sgt i32 %m, 0
  %wide.trip.count = zext i32 %2 to i64
  %3 = add nsw i64 %0, -1
  %4 = shl nuw nsw i64 %wide.trip.count, 3
  %xtraiter = and i64 %0, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %5 = icmp ult i64 %3, 3
  %xtraiter61 = and i64 %0, 1
  %lcmp.mod62 = icmp eq i64 %xtraiter61, 0
  %6 = icmp eq i64 %3, 0
  %xtraiter68 = and i64 %0, 1
  %lcmp.mod69 = icmp ne i64 %xtraiter68, 0
  %7 = icmp eq i64 %3, 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc86.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv1153 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next1022, %for.inc86.for.cond1.preheader_crit_edge ]
  %8 = mul nuw nsw i64 %indvars.iv1153, 1201
  %9 = add nuw nsw i64 %8, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %9
  %scevgep63 = bitcast double* %scevgep to i8*
  %10 = mul nsw i64 %indvars.iv1153, -8
  %11 = add nsw i64 %4, %10
  br i1 %cmp213, label %for.inc.preheader, label %for.end.thread

for.end.thread:                                   ; preds = %for.cond1.preheader
  %arrayidx1379 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv1153, i64 %indvars.iv1153
  store double 0.000000e+00, double* %arrayidx1379, align 8
  br label %for.cond33.preheader

for.inc.preheader:                                ; preds = %for.cond1.preheader
  br i1 %lcmp.mod, label %for.inc.preheader.for.inc.prol.loopexit_crit_edge, label %for.inc.prol.preheader

for.inc.preheader.for.inc.prol.loopexit_crit_edge: ; preds = %for.inc.preheader
  br label %for.inc.prol.loopexit

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.for.inc.prol_crit_edge, %for.inc.prol.preheader
  %nrm.015.prol = phi double [ %add.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0.000000e+00, %for.inc.prol.preheader ]
  %indvars.iv14.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0, %for.inc.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc.prol.for.inc.prol_crit_edge ], [ %xtraiter, %for.inc.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv14.prol, i64 %indvars.iv1153
  %12 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %12, %12
  %add.prol = fadd double %nrm.015.prol, %mul.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv14.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol.for.inc.prol_crit_edge, !llvm.loop !3

for.inc.prol.for.inc.prol_crit_edge:              ; preds = %for.inc.prol
  br label %for.inc.prol

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.preheader.for.inc.prol.loopexit_crit_edge, %for.inc.prol.loopexit.loopexit
  %nrm.015.unr = phi double [ 0.000000e+00, %for.inc.preheader.for.inc.prol.loopexit_crit_edge ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %indvars.iv14.unr = phi i64 [ 0, %for.inc.preheader.for.inc.prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %for.inc.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.inc.preheader.for.inc.prol.loopexit_crit_edge ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  br i1 %5, label %for.inc.prol.loopexit.for.end_crit_edge, label %for.inc.preheader88

for.inc.prol.loopexit.for.end_crit_edge:          ; preds = %for.inc.prol.loopexit
  br label %for.end

for.inc.preheader88:                              ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.inc.preheader88
  %nrm.015 = phi double [ %add.3, %for.inc.for.inc_crit_edge ], [ %nrm.015.unr, %for.inc.preheader88 ]
  %indvars.iv14 = phi i64 [ %indvars.iv.next.3, %for.inc.for.inc_crit_edge ], [ %indvars.iv14.unr, %for.inc.preheader88 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv1153
  %13 = load double, double* %arrayidx5, align 8
  %mul = fmul double %13, %13
  %add = fadd double %nrm.015, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv1153
  %14 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %14, %14
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv14, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv1153
  %15 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %15, %15
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv14, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv1153
  %16 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %16, %16
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv14, 4
  %exitcond59.3 = icmp eq i64 %indvars.iv.next.3, %0
  br i1 %exitcond59.3, label %for.end.loopexit, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  br label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.inc.prol.loopexit.for.end_crit_edge, %for.end.loopexit
  %nrm.0.lcssa = phi double [ %add.lcssa.unr, %for.inc.prol.loopexit.for.end_crit_edge ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %nrm.0.lcssa) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv1153, i64 %indvars.iv1153
  store double %call, double* %arrayidx13, align 8
  br i1 %cmp213, label %for.inc29.preheader, label %for.end.for.cond33.preheader_crit_edge

for.end.for.cond33.preheader_crit_edge:           ; preds = %for.end
  br label %for.cond33.preheader

for.inc29.preheader:                              ; preds = %for.end
  br i1 %lcmp.mod62, label %for.inc29.preheader.for.inc29.prol.loopexit.unr-lcssa_crit_edge, label %for.inc29.prol.preheader

for.inc29.preheader.for.inc29.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.inc29.preheader
  br label %for.inc29.prol.loopexit.unr-lcssa

for.inc29.prol.preheader:                         ; preds = %for.inc29.preheader
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv1153
  %17 = load double, double* %arrayidx20.prol, align 8
  %div.prol = fdiv double %17, %call
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv1153
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.inc29.prol.loopexit.unr-lcssa

for.inc29.prol.loopexit.unr-lcssa:                ; preds = %for.inc29.preheader.for.inc29.prol.loopexit.unr-lcssa_crit_edge, %for.inc29.prol.preheader
  %indvars.iv117.unr.ph = phi i64 [ 1, %for.inc29.prol.preheader ], [ 0, %for.inc29.preheader.for.inc29.prol.loopexit.unr-lcssa_crit_edge ]
  br i1 %6, label %for.inc29.prol.loopexit.unr-lcssa.for.cond33.preheader_crit_edge, label %for.inc29.preheader87

for.inc29.prol.loopexit.unr-lcssa.for.cond33.preheader_crit_edge: ; preds = %for.inc29.prol.loopexit.unr-lcssa
  br label %for.cond33.preheader

for.inc29.preheader87:                            ; preds = %for.inc29.prol.loopexit.unr-lcssa
  br label %for.inc29

for.cond33.preheader.loopexit:                    ; preds = %for.inc29
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.inc29.prol.loopexit.unr-lcssa.for.cond33.preheader_crit_edge, %for.end.for.cond33.preheader_crit_edge, %for.cond33.preheader.loopexit, %for.end.thread
  %indvars.iv.next1022 = add nuw nsw i64 %indvars.iv1153, 1
  %exitcond23 = icmp eq i64 %indvars.iv1153, %wide.trip.count
  br i1 %exitcond23, label %for.cond33.preheader.for.inc86_crit_edge, label %for.body35.lr.ph

for.cond33.preheader.for.inc86_crit_edge:         ; preds = %for.cond33.preheader
  br label %for.inc86

for.body35.lr.ph:                                 ; preds = %for.cond33.preheader
  br i1 %cmp213, label %for.body35.us.preheader, label %for.body35.preheader

for.body35.us.preheader:                          ; preds = %for.body35.lr.ph
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv1153
  %arrayidx70.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv1153
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.cond33.loopexit.us.for.body35.us_crit_edge, %for.body35.us.preheader
  %indvars.iv.next1024.us = phi i64 [ %indvars.iv.next10.us, %for.cond33.loopexit.us.for.body35.us_crit_edge ], [ %indvars.iv.next1022, %for.body35.us.preheader ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv1153, i64 %indvars.iv.next1024.us
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 %lcmp.mod69, label %for.inc57.us.prol.preheader, label %for.body35.us.for.inc57.us.prol.loopexit.unr-lcssa_crit_edge

for.body35.us.for.inc57.us.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.body35.us
  br label %for.inc57.us.prol.loopexit.unr-lcssa

for.inc57.us.prol.preheader:                      ; preds = %for.body35.us
  %18 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv.next1024.us
  %19 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %18, %19
  %add56.us.prol = fadd double %mul51.us.prol, 0.000000e+00
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.inc57.us.prol.loopexit.unr-lcssa

for.inc57.us.prol.loopexit.unr-lcssa:             ; preds = %for.body35.us.for.inc57.us.prol.loopexit.unr-lcssa_crit_edge, %for.inc57.us.prol.preheader
  %20 = phi double [ %add56.us.prol, %for.inc57.us.prol.preheader ], [ 0.000000e+00, %for.body35.us.for.inc57.us.prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv319.us.unr.ph = phi i64 [ 1, %for.inc57.us.prol.preheader ], [ 0, %for.body35.us.for.inc57.us.prol.loopexit.unr-lcssa_crit_edge ]
  br i1 %7, label %for.inc57.us.prol.loopexit.unr-lcssa.for.inc80.us.preheader_crit_edge, label %for.inc57.us.preheader

for.inc57.us.prol.loopexit.unr-lcssa.for.inc80.us.preheader_crit_edge: ; preds = %for.inc57.us.prol.loopexit.unr-lcssa
  br label %for.inc80.us.preheader

for.inc57.us.preheader:                           ; preds = %for.inc57.us.prol.loopexit.unr-lcssa
  br label %for.inc57.us

for.inc80.us:                                     ; preds = %for.inc80.us.for.inc80.us_crit_edge, %for.inc80.us.preheader86
  %indvars.iv521.us = phi i64 [ %indvars.iv.next6.us.1, %for.inc80.us.for.inc80.us_crit_edge ], [ %indvars.iv521.us.unr.ph, %for.inc80.us.preheader86 ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv521.us, i64 %indvars.iv.next1024.us
  %21 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv521.us, i64 %indvars.iv1153
  %22 = load double, double* %arrayidx70.us, align 8
  %23 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %22, %23
  %sub.us = fsub double %21, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv521.us, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next6.us, i64 %indvars.iv.next1024.us
  %24 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next6.us, i64 %indvars.iv1153
  %25 = load double, double* %arrayidx70.us.1, align 8
  %26 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %25, %26
  %sub.us.1 = fsub double %24, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next6.us.1 = add nsw i64 %indvars.iv521.us, 2
  %exitcond.175 = icmp eq i64 %indvars.iv.next6.us.1, %0
  br i1 %exitcond.175, label %for.cond33.loopexit.us.loopexit, label %for.inc80.us.for.inc80.us_crit_edge

for.inc80.us.for.inc80.us_crit_edge:              ; preds = %for.inc80.us
  br label %for.inc80.us

for.inc57.us:                                     ; preds = %for.inc57.us.for.inc57.us_crit_edge, %for.inc57.us.preheader
  %27 = phi double [ %add56.us.1, %for.inc57.us.for.inc57.us_crit_edge ], [ %20, %for.inc57.us.preheader ]
  %indvars.iv319.us = phi i64 [ %indvars.iv.next4.us.1, %for.inc57.us.for.inc57.us_crit_edge ], [ %indvars.iv319.us.unr.ph, %for.inc57.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv319.us, i64 %indvars.iv1153
  %28 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv319.us, i64 %indvars.iv.next1024.us
  %29 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %28, %29
  %add56.us = fadd double %27, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv319.us, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next4.us, i64 %indvars.iv1153
  %30 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next4.us, i64 %indvars.iv.next1024.us
  %31 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %30, %31
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next4.us.1 = add nsw i64 %indvars.iv319.us, 2
  %exitcond.171 = icmp eq i64 %indvars.iv.next4.us.1, %0
  br i1 %exitcond.171, label %for.inc80.us.preheader.loopexit, label %for.inc57.us.for.inc57.us_crit_edge

for.inc57.us.for.inc57.us_crit_edge:              ; preds = %for.inc57.us
  br label %for.inc57.us

for.cond33.loopexit.us.loopexit:                  ; preds = %for.inc80.us
  br label %for.cond33.loopexit.us

for.cond33.loopexit.us:                           ; preds = %for.inc80.us.prol.loopexit.unr-lcssa.for.cond33.loopexit.us_crit_edge, %for.cond33.loopexit.us.loopexit
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv.next1024.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next1024.us, %wide.trip.count
  br i1 %exitcond.us, label %for.inc86.loopexit, label %for.cond33.loopexit.us.for.body35.us_crit_edge

for.cond33.loopexit.us.for.body35.us_crit_edge:   ; preds = %for.cond33.loopexit.us
  br label %for.body35.us

for.inc80.us.preheader.loopexit:                  ; preds = %for.inc57.us
  br label %for.inc80.us.preheader

for.inc80.us.preheader:                           ; preds = %for.inc57.us.prol.loopexit.unr-lcssa.for.inc80.us.preheader_crit_edge, %for.inc80.us.preheader.loopexit
  %32 = phi double [ %20, %for.inc57.us.prol.loopexit.unr-lcssa.for.inc80.us.preheader_crit_edge ], [ %add56.us.1, %for.inc80.us.preheader.loopexit ]
  br i1 %lcmp.mod69, label %for.inc80.us.prol.preheader, label %for.inc80.us.preheader.for.inc80.us.prol.loopexit.unr-lcssa_crit_edge

for.inc80.us.preheader.for.inc80.us.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.inc80.us.preheader
  br label %for.inc80.us.prol.loopexit.unr-lcssa

for.inc80.us.prol.preheader:                      ; preds = %for.inc80.us.preheader
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv.next1024.us
  %33 = load double, double* %arrayidx66.us.prol, align 8
  %34 = load double, double* %arrayidx70.us.prol, align 8
  %mul75.us.prol = fmul double %34, %32
  %sub.us.prol = fsub double %33, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.inc80.us.prol.loopexit.unr-lcssa

for.inc80.us.prol.loopexit.unr-lcssa:             ; preds = %for.inc80.us.preheader.for.inc80.us.prol.loopexit.unr-lcssa_crit_edge, %for.inc80.us.prol.preheader
  %indvars.iv521.us.unr.ph = phi i64 [ 1, %for.inc80.us.prol.preheader ], [ 0, %for.inc80.us.preheader.for.inc80.us.prol.loopexit.unr-lcssa_crit_edge ]
  br i1 %7, label %for.inc80.us.prol.loopexit.unr-lcssa.for.cond33.loopexit.us_crit_edge, label %for.inc80.us.preheader86

for.inc80.us.prol.loopexit.unr-lcssa.for.cond33.loopexit.us_crit_edge: ; preds = %for.inc80.us.prol.loopexit.unr-lcssa
  br label %for.cond33.loopexit.us

for.inc80.us.preheader86:                         ; preds = %for.inc80.us.prol.loopexit.unr-lcssa
  br label %for.inc80.us

for.body35.preheader:                             ; preds = %for.body35.lr.ph
  call void @llvm.memset.p0i8.i64(i8* %scevgep63, i8 0, i64 %11, i32 8, i1 false)
  br label %for.inc86

for.inc29:                                        ; preds = %for.inc29.for.inc29_crit_edge, %for.inc29.preheader87
  %indvars.iv117 = phi i64 [ %indvars.iv.next2.1, %for.inc29.for.inc29_crit_edge ], [ %indvars.iv117.unr.ph, %for.inc29.preheader87 ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv117, i64 %indvars.iv1153
  %35 = load double, double* %arrayidx20, align 8
  %36 = load double, double* %arrayidx13, align 8
  %div = fdiv double %35, %36
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv117, i64 %indvars.iv1153
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv117, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next2, i64 %indvars.iv1153
  %37 = load double, double* %arrayidx20.1, align 8
  %38 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %37, %38
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next2, i64 %indvars.iv1153
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next2.1 = add nsw i64 %indvars.iv117, 2
  %exitcond60.1 = icmp eq i64 %indvars.iv.next2.1, %0
  br i1 %exitcond60.1, label %for.cond33.preheader.loopexit, label %for.inc29.for.inc29_crit_edge

for.inc29.for.inc29_crit_edge:                    ; preds = %for.inc29
  br label %for.inc29

for.inc86.loopexit:                               ; preds = %for.cond33.loopexit.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.cond33.preheader.for.inc86_crit_edge, %for.inc86.loopexit, %for.body35.preheader
  %exitcond = icmp eq i64 %indvars.iv.next1022, %1
  br i1 %exitcond, label %for.end88.loopexit, label %for.inc86.for.cond1.preheader_crit_edge

for.inc86.for.cond1.preheader_crit_edge:          ; preds = %for.inc86
  br label %for.cond1.preheader

for.end88.loopexit:                               ; preds = %for.inc86
  br label %for.end88

for.end88:                                        ; preds = %entry.for.end88_crit_edge, %for.end88.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readnone %A, [1200 x double]* nocapture readonly %R, [1200 x double]* nocapture readonly %Q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %3 = sext i32 %n to i64
  %cmp21 = icmp sgt i32 %n, 0
  br i1 %cmp21, label %for.cond2.preheader.preheader, label %entry.for.end12_crit_edge

entry.for.end12_crit_edge:                        ; preds = %entry
  br label %for.end12

for.cond2.preheader.preheader:                    ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10.for.cond2.preheader_crit_edge, %for.cond2.preheader.preheader
  %indvars.iv1122 = phi i64 [ %indvars.iv.next12, %for.inc10.for.cond2.preheader_crit_edge ], [ 0, %for.cond2.preheader.preheader ]
  %4 = mul nsw i64 %indvars.iv1122, %3
  br label %for.body4

for.body4:                                        ; preds = %for.inc.for.body4_crit_edge, %for.cond2.preheader
  %indvars.iv820 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next9, %for.inc.for.body4_crit_edge ]
  %5 = add nsw i64 %indvars.iv820, %4
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.body4.for.inc_crit_edge

for.body4.for.inc_crit_edge:                      ; preds = %for.body4
  br label %for.inc

if.then:                                          ; preds = %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body4.for.inc_crit_edge, %if.then
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv1122, i64 %indvars.iv820
  %9 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #7
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv820, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, %wide.trip.count
  br i1 %exitcond, label %for.inc10, label %for.inc.for.body4_crit_edge

for.inc.for.body4_crit_edge:                      ; preds = %for.inc
  br label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1122, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next12, %3
  br i1 %exitcond29, label %for.end12.loopexit, label %for.inc10.for.cond2.preheader_crit_edge

for.inc10.for.cond2.preheader_crit_edge:          ; preds = %for.inc10
  br label %for.cond2.preheader

for.end12.loopexit:                               ; preds = %for.inc10
  br label %for.end12

for.end12:                                        ; preds = %entry.for.end12_crit_edge, %for.end12.loopexit
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %12 = sext i32 %m to i64
  %cmp1616.not = icmp slt i32 %m, 1
  %cmp21.not = xor i1 %cmp21, true
  %brmerge = or i1 %cmp1616.not, %cmp21.not
  br i1 %brmerge, label %for.end12.for.end38_crit_edge, label %for.cond18.preheader.us.preheader

for.end12.for.end38_crit_edge:                    ; preds = %for.end12
  br label %for.end38

for.cond18.preheader.us.preheader:                ; preds = %for.end12
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.for.inc36_crit_edge.us.for.cond18.preheader.us_crit_edge, %for.cond18.preheader.us.preheader
  %indvars.iv517.us = phi i64 [ %indvars.iv.next6.us, %for.cond18.for.inc36_crit_edge.us.for.cond18.preheader.us_crit_edge ], [ 0, %for.cond18.preheader.us.preheader ]
  %13 = mul nsw i64 %indvars.iv517.us, %3
  br label %for.body20.us

for.body20.us:                                    ; preds = %for.inc33.us.for.body20.us_crit_edge, %for.cond18.preheader.us
  %indvars.iv15.us = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next.us, %for.inc33.us.for.body20.us_crit_edge ]
  %14 = add nsw i64 %indvars.iv15.us, %13
  %15 = trunc i64 %14 to i32
  %rem23.us = srem i32 %15, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %for.body20.us.for.inc33.us_crit_edge

for.body20.us.for.inc33.us_crit_edge:             ; preds = %for.body20.us
  br label %for.inc33.us

if.then25.us:                                     ; preds = %for.body20.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.body20.us.for.inc33.us_crit_edge, %if.then25.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv517.us, i64 %indvars.iv15.us
  %18 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv15.us, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next.us, %3
  br i1 %exitcond26, label %for.cond18.for.inc36_crit_edge.us, label %for.inc33.us.for.body20.us_crit_edge

for.inc33.us.for.body20.us_crit_edge:             ; preds = %for.inc33.us
  br label %for.body20.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %for.inc33.us
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv517.us, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next6.us, %12
  br i1 %exitcond27, label %for.end38.loopexit, label %for.cond18.for.inc36_crit_edge.us.for.cond18.preheader.us_crit_edge

for.cond18.for.inc36_crit_edge.us.for.cond18.preheader.us_crit_edge: ; preds = %for.cond18.for.inc36_crit_edge.us
  br label %for.cond18.preheader.us

for.end38.loopexit:                               ; preds = %for.cond18.for.inc36_crit_edge.us
  br label %for.end38

for.end38:                                        ; preds = %for.end12.for.end38_crit_edge, %for.end38.loopexit
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
