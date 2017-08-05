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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  %cmp22 = icmp sgt i32 %m, 0
  br i1 %cmp22, label %for.cond1.preheader.lr.ph, label %entry.for.cond15.preheader_crit_edge

entry.for.cond15.preheader_crit_edge:             ; preds = %entry
  br label %for.cond15.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp220 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  br i1 %cmp220, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.lr.ph.for.end32_crit_edge

for.cond1.preheader.lr.ph.for.end32_crit_edge:    ; preds = %for.cond1.preheader.lr.ph
  br label %for.end32

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count30 = zext i32 %n to i64
  %wide.trip.count35 = zext i32 %m to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc12_crit_edge.us.for.cond1.preheader.us_crit_edge, %for.cond1.preheader.us.preheader
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.cond1.for.inc12_crit_edge.us.for.cond1.preheader.us_crit_edge ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv27 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next28, %for.body3.us.for.body3.us_crit_edge ]
  %0 = mul nuw nsw i64 %indvars.iv27, %indvars.iv33
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv27
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv33, i64 %indvars.iv27
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next28, %wide.trip.count30
  br i1 %exitcond, label %for.cond1.for.inc12_crit_edge.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  br label %for.body3.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %for.cond15.preheader.loopexit, label %for.cond1.for.inc12_crit_edge.us.for.cond1.preheader.us_crit_edge

for.cond1.for.inc12_crit_edge.us.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond1.preheader.us

for.cond15.preheader.loopexit:                    ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %entry.for.cond15.preheader_crit_edge, %for.cond15.preheader.loopexit
  %cmp1618 = icmp sgt i32 %n, 0
  br i1 %cmp1618, label %for.cond19.preheader.us.preheader, label %for.cond15.preheader.for.end32_crit_edge

for.cond15.preheader.for.end32_crit_edge:         ; preds = %for.cond15.preheader
  br label %for.end32

for.cond19.preheader.us.preheader:                ; preds = %for.cond15.preheader
  %2 = add i32 %n, -1
  %3 = zext i32 %2 to i64
  %4 = shl nuw nsw i64 %3, 3
  %5 = add nuw nsw i64 %4, 8
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond19.preheader.us.preheader.for.cond19.preheader.us.prol.loopexit_crit_edge, label %for.cond19.for.inc30_crit_edge.us.prol.preheader

for.cond19.preheader.us.preheader.for.cond19.preheader.us.prol.loopexit_crit_edge: ; preds = %for.cond19.preheader.us.preheader
  br label %for.cond19.preheader.us.prol.loopexit

for.cond19.for.inc30_crit_edge.us.prol.preheader: ; preds = %for.cond19.preheader.us.preheader
  %6 = add nsw i32 %xtraiter, -1
  %7 = zext i32 %6 to i64
  br label %for.cond19.for.inc30_crit_edge.us.prol

for.cond19.for.inc30_crit_edge.us.prol:           ; preds = %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge, %for.cond19.for.inc30_crit_edge.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge ], [ 0, %for.cond19.for.inc30_crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge ], [ %xtraiter, %for.cond19.for.inc30_crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.prol, i64 0
  %scevgep26.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond19.preheader.us.prol.loopexit.loopexit, label %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge, !llvm.loop !1

for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge: ; preds = %for.cond19.for.inc30_crit_edge.us.prol
  br label %for.cond19.for.inc30_crit_edge.us.prol

for.cond19.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond19.for.inc30_crit_edge.us.prol
  %8 = add nuw nsw i64 %7, 1
  br label %for.cond19.preheader.us.prol.loopexit

for.cond19.preheader.us.prol.loopexit:            ; preds = %for.cond19.preheader.us.preheader.for.cond19.preheader.us.prol.loopexit_crit_edge, %for.cond19.preheader.us.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %for.cond19.preheader.us.preheader.for.cond19.preheader.us.prol.loopexit_crit_edge ], [ %8, %for.cond19.preheader.us.prol.loopexit.loopexit ]
  %9 = icmp ult i32 %2, 3
  br i1 %9, label %for.cond19.preheader.us.prol.loopexit.for.end32_crit_edge, label %for.cond19.for.inc30_crit_edge.us.3.preheader

for.cond19.preheader.us.prol.loopexit.for.end32_crit_edge: ; preds = %for.cond19.preheader.us.prol.loopexit
  br label %for.end32

for.cond19.for.inc30_crit_edge.us.3.preheader:    ; preds = %for.cond19.preheader.us.prol.loopexit
  %wide.trip.count.3 = zext i32 %n to i64
  %10 = add nsw i64 %wide.trip.count.3, -4
  %11 = sub nsw i64 %10, %indvars.iv.unr
  %12 = lshr i64 %11, 2
  %13 = and i64 %12, 1
  %lcmp.mod40 = icmp eq i64 %13, 0
  br i1 %lcmp.mod40, label %for.cond19.for.inc30_crit_edge.us.3.prol.preheader, label %for.cond19.for.inc30_crit_edge.us.3.preheader.for.cond19.for.inc30_crit_edge.us.3.prol.loopexit_crit_edge

for.cond19.for.inc30_crit_edge.us.3.preheader.for.cond19.for.inc30_crit_edge.us.3.prol.loopexit_crit_edge: ; preds = %for.cond19.for.inc30_crit_edge.us.3.preheader
  br label %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit

for.cond19.for.inc30_crit_edge.us.3.prol.preheader: ; preds = %for.cond19.for.inc30_crit_edge.us.3.preheader
  br label %for.cond19.for.inc30_crit_edge.us.3.prol

for.cond19.for.inc30_crit_edge.us.3.prol:         ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.preheader
  %scevgep.prol42 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.unr, i64 0
  %scevgep26.prol43 = bitcast double* %scevgep.prol42 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.prol43, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.prol44 = add nuw nsw i64 %indvars.iv.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.prol44, i64 0
  %scevgep26.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.1.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1.prol, i64 0
  %scevgep26.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.2.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.2.prol = add nsw i64 %indvars.iv.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2.prol, i64 0
  %scevgep26.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.3.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit

for.cond19.for.inc30_crit_edge.us.3.prol.loopexit: ; preds = %for.cond19.for.inc30_crit_edge.us.3.preheader.for.cond19.for.inc30_crit_edge.us.3.prol.loopexit_crit_edge, %for.cond19.for.inc30_crit_edge.us.3.prol
  %indvars.iv.unr45 = phi i64 [ %indvars.iv.unr, %for.cond19.for.inc30_crit_edge.us.3.preheader.for.cond19.for.inc30_crit_edge.us.3.prol.loopexit_crit_edge ], [ %indvars.iv.next.3.prol, %for.cond19.for.inc30_crit_edge.us.3.prol ]
  %14 = icmp eq i64 %12, 0
  br i1 %14, label %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit.for.end32.loopexit_crit_edge, label %for.cond19.for.inc30_crit_edge.us.3.preheader.new

for.cond19.for.inc30_crit_edge.us.3.prol.loopexit.for.end32.loopexit_crit_edge: ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit
  br label %for.end32.loopexit

for.cond19.for.inc30_crit_edge.us.3.preheader.new: ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit
  br label %for.cond19.for.inc30_crit_edge.us.3

for.end32.loopexit.unr-lcssa:                     ; preds = %for.cond19.for.inc30_crit_edge.us.3
  br label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit.for.end32.loopexit_crit_edge, %for.end32.loopexit.unr-lcssa
  br label %for.end32

for.end32:                                        ; preds = %for.cond19.preheader.us.prol.loopexit.for.end32_crit_edge, %for.cond15.preheader.for.end32_crit_edge, %for.cond1.preheader.lr.ph.for.end32_crit_edge, %for.end32.loopexit
  ret void

for.cond19.for.inc30_crit_edge.us.3:              ; preds = %for.cond19.for.inc30_crit_edge.us.3.for.cond19.for.inc30_crit_edge.us.3_crit_edge, %for.cond19.for.inc30_crit_edge.us.3.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr45, %for.cond19.for.inc30_crit_edge.us.3.preheader.new ], [ %indvars.iv.next.3.1, %for.cond19.for.inc30_crit_edge.us.3.for.cond19.for.inc30_crit_edge.us.3_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 0
  %scevgep26 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next, i64 0
  %scevgep26.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1, i64 0
  %scevgep26.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.2, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2, i64 0
  %scevgep26.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.3, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %scevgep.146 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.3, i64 0
  %scevgep26.147 = bitcast double* %scevgep.146 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.147, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.148 = add nsw i64 %indvars.iv, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.148, i64 0
  %scevgep26.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.1.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1.1, i64 0
  %scevgep26.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.2.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.2.1 = add nsw i64 %indvars.iv, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2.1, i64 0
  %scevgep26.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.3.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %wide.trip.count.3
  br i1 %exitcond.3.1, label %for.end32.loopexit.unr-lcssa, label %for.cond19.for.inc30_crit_edge.us.3.for.cond19.for.inc30_crit_edge.us.3_crit_edge

for.cond19.for.inc30_crit_edge.us.3.for.cond19.for.inc30_crit_edge.us.3_crit_edge: ; preds = %for.cond19.for.inc30_crit_edge.us.3
  br label %for.cond19.for.inc30_crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  %cmp92 = icmp sgt i32 %n, 0
  br i1 %cmp92, label %for.cond1.preheader.lr.ph, label %entry.for.end88_crit_edge

entry.for.end88_crit_edge:                        ; preds = %entry
  br label %for.end88

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp250 = icmp sgt i32 %m, 0
  %cmp1553 = icmp sgt i32 %m, 0
  %cmp4155 = icmp sgt i32 %m, 0
  %cmp6157 = icmp sgt i32 %m, 0
  %0 = add i32 %m, -1
  %1 = add i32 %n, -2
  %2 = zext i32 %1 to i64
  %3 = sext i32 %n to i64
  %xtraiter = and i32 %m, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %4 = icmp ult i32 %0, 3
  %wide.trip.count.3 = zext i32 %m to i64
  %xtraiter98 = and i32 %m, 1
  %lcmp.mod99 = icmp eq i32 %xtraiter98, 0
  %5 = icmp eq i32 %0, 0
  %wide.trip.count97.1 = zext i32 %m to i64
  %xtraiter110 = and i32 %m, 1
  %lcmp.mod111 = icmp eq i32 %xtraiter110, 0
  %6 = icmp eq i32 %0, 0
  %xtraiter117 = and i32 %m, 1
  %lcmp.mod118 = icmp eq i32 %xtraiter117, 0
  %7 = icmp eq i32 %0, 0
  %wide.trip.count116.1 = zext i32 %m to i64
  %wide.trip.count125 = zext i32 %n to i64
  %wide.trip.count109.1 = zext i32 %m to i64
  %wide.trip.count130 = zext i32 %n to i64
  %8 = add nsw i32 %xtraiter, -1
  %9 = zext i32 %8 to i64
  %10 = add nuw nsw i64 %9, 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc86.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv128 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next129, %for.inc86.for.cond1.preheader_crit_edge ]
  %indvars.iv121 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next122, %for.inc86.for.cond1.preheader_crit_edge ]
  %11 = mul nuw nsw i64 %indvars.iv128, 1201
  %12 = add nuw nsw i64 %11, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %12
  %scevgep106 = bitcast double* %scevgep to i8*
  %13 = sub i64 %2, %indvars.iv128
  %14 = shl i64 %13, 3
  %15 = and i64 %14, 34359738360
  %16 = add nuw nsw i64 %15, 8
  br i1 %cmp250, label %for.body3.lr.ph, label %for.cond1.preheader.for.end_crit_edge

for.cond1.preheader.for.end_crit_edge:            ; preds = %for.cond1.preheader
  br label %for.end

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br i1 %lcmp.mod, label %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge, label %for.body3.prol.preheader

for.body3.lr.ph.for.body3.prol.loopexit_crit_edge: ; preds = %for.body3.lr.ph
  br label %for.body3.prol.loopexit

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.for.body3.prol_crit_edge, %for.body3.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.prol.for.body3.prol_crit_edge ], [ 0, %for.body3.prol.preheader ]
  %nrm.051.prol = phi double [ %add.prol, %for.body3.prol.for.body3.prol_crit_edge ], [ 0.000000e+00, %for.body3.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.prol.for.body3.prol_crit_edge ], [ %xtraiter, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.prol, i64 %indvars.iv128
  %17 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %17, %17
  %add.prol = fadd double %nrm.051.prol, %mul.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol.for.body3.prol_crit_edge, !llvm.loop !3

for.body3.prol.for.body3.prol_crit_edge:          ; preds = %for.body3.prol
  br label %for.body3.prol

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge, %for.body3.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge ], [ %10, %for.body3.prol.loopexit.loopexit ]
  %nrm.051.unr = phi double [ 0.000000e+00, %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge ], [ %add.prol, %for.body3.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge ], [ %add.prol, %for.body3.prol.loopexit.loopexit ]
  br i1 %4, label %for.body3.prol.loopexit.for.end_crit_edge, label %for.body3.preheader

for.body3.prol.loopexit.for.end_crit_edge:        ; preds = %for.body3.prol.loopexit
  br label %for.end

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.for.body3_crit_edge, %for.body3.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.for.body3_crit_edge ], [ %indvars.iv.unr, %for.body3.preheader ]
  %nrm.051 = phi double [ %add.3, %for.body3.for.body3_crit_edge ], [ %nrm.051.unr, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv128
  %18 = load double, double* %arrayidx5, align 8
  %mul = fmul double %18, %18
  %add = fadd double %nrm.051, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv128
  %19 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %19, %19
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv128
  %20 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %20, %20
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv128
  %21 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %21, %21
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.end.loopexit, label %for.body3.for.body3_crit_edge

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  br label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.body3.prol.loopexit.for.end_crit_edge, %for.cond1.preheader.for.end_crit_edge, %for.end.loopexit
  %nrm.0.lcssa = phi double [ 0.000000e+00, %for.cond1.preheader.for.end_crit_edge ], [ %add.lcssa.unr, %for.body3.prol.loopexit.for.end_crit_edge ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %nrm.0.lcssa) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv128, i64 %indvars.iv128
  store double %call, double* %arrayidx13, align 8
  br i1 %cmp1553, label %for.body16.preheader, label %for.end.for.cond33.preheader_crit_edge

for.end.for.cond33.preheader_crit_edge:           ; preds = %for.end
  br label %for.cond33.preheader

for.body16.preheader:                             ; preds = %for.end
  br i1 %lcmp.mod99, label %for.body16.preheader.for.body16.prol.loopexit_crit_edge, label %for.body16.prol

for.body16.preheader.for.body16.prol.loopexit_crit_edge: ; preds = %for.body16.preheader
  br label %for.body16.prol.loopexit

for.body16.prol:                                  ; preds = %for.body16.preheader
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv128
  %22 = load double, double* %arrayidx20.prol, align 8
  %23 = load double, double* %arrayidx13, align 8
  %div.prol = fdiv double %22, %23
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv128
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.body16.prol.loopexit

for.body16.prol.loopexit:                         ; preds = %for.body16.preheader.for.body16.prol.loopexit_crit_edge, %for.body16.prol
  %indvars.iv95.unr.ph = phi i64 [ 1, %for.body16.prol ], [ 0, %for.body16.preheader.for.body16.prol.loopexit_crit_edge ]
  br i1 %5, label %for.body16.prol.loopexit.for.cond33.preheader_crit_edge, label %for.body16.preheader137

for.body16.prol.loopexit.for.cond33.preheader_crit_edge: ; preds = %for.body16.prol.loopexit
  br label %for.cond33.preheader

for.body16.preheader137:                          ; preds = %for.body16.prol.loopexit
  br label %for.body16

for.cond33.preheader.loopexit:                    ; preds = %for.body16
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.body16.prol.loopexit.for.cond33.preheader_crit_edge, %for.end.for.cond33.preheader_crit_edge, %for.cond33.preheader.loopexit
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %cmp3460 = icmp slt i64 %indvars.iv.next129, %3
  br i1 %cmp3460, label %for.body35.lr.ph, label %for.cond33.preheader.for.inc86_crit_edge

for.cond33.preheader.for.inc86_crit_edge:         ; preds = %for.cond33.preheader
  br label %for.inc86

for.body35.lr.ph:                                 ; preds = %for.cond33.preheader
  br i1 %cmp4155, label %for.body35.us.preheader, label %for.inc86.loopexit94

for.body35.us.preheader:                          ; preds = %for.body35.lr.ph
  %arrayidx70.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv128
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv128
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.cond33.loopexit.us.for.body35.us_crit_edge, %for.body35.us.preheader
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %for.cond33.loopexit.us.for.body35.us_crit_edge ], [ %indvars.iv121, %for.body35.us.preheader ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv128, i64 %indvars.iv123
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 %lcmp.mod111, label %for.body35.us.for.body42.us.prol.loopexit_crit_edge, label %for.body42.us.prol

for.body35.us.for.body42.us.prol.loopexit_crit_edge: ; preds = %for.body35.us
  br label %for.body42.us.prol.loopexit

for.body42.us.prol:                               ; preds = %for.body35.us
  %24 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv123
  %25 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %24, %25
  %26 = load double, double* %arrayidx39.us, align 8
  %add56.us.prol = fadd double %26, %mul51.us.prol
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.body42.us.prol.loopexit

for.body42.us.prol.loopexit:                      ; preds = %for.body35.us.for.body42.us.prol.loopexit_crit_edge, %for.body42.us.prol
  %indvars.iv107.unr.ph = phi i64 [ 1, %for.body42.us.prol ], [ 0, %for.body35.us.for.body42.us.prol.loopexit_crit_edge ]
  br i1 %6, label %for.body42.us.prol.loopexit.for.cond40.for.cond60.preheader_crit_edge.us_crit_edge, label %for.body42.us.preheader

for.body42.us.prol.loopexit.for.cond40.for.cond60.preheader_crit_edge.us_crit_edge: ; preds = %for.body42.us.prol.loopexit
  br label %for.cond40.for.cond60.preheader_crit_edge.us

for.body42.us.preheader:                          ; preds = %for.body42.us.prol.loopexit
  br label %for.body42.us

for.cond33.loopexit.us.loopexit:                  ; preds = %for.body62.us
  br label %for.cond33.loopexit.us

for.cond33.loopexit.us:                           ; preds = %for.body62.us.prol.loopexit.for.cond33.loopexit.us_crit_edge, %for.cond40.for.cond60.preheader_crit_edge.us.for.cond33.loopexit.us_crit_edge, %for.cond33.loopexit.us.loopexit
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond = icmp eq i64 %indvars.iv.next124, %wide.trip.count125
  br i1 %exitcond, label %for.inc86.loopexit, label %for.cond33.loopexit.us.for.body35.us_crit_edge

for.cond33.loopexit.us.for.body35.us_crit_edge:   ; preds = %for.cond33.loopexit.us
  br label %for.body35.us

for.body62.us:                                    ; preds = %for.body62.us.for.body62.us_crit_edge, %for.body62.us.preheader136
  %indvars.iv114 = phi i64 [ %indvars.iv.next115.1, %for.body62.us.for.body62.us_crit_edge ], [ %indvars.iv114.unr.ph, %for.body62.us.preheader136 ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv114, i64 %indvars.iv123
  %27 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv114, i64 %indvars.iv128
  %28 = load double, double* %arrayidx70.us, align 8
  %29 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %28, %29
  %sub.us = fsub double %27, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next115, i64 %indvars.iv123
  %30 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next115, i64 %indvars.iv128
  %31 = load double, double* %arrayidx70.us.1, align 8
  %32 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %31, %32
  %sub.us.1 = fsub double %30, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next115.1 = add nuw nsw i64 %indvars.iv114, 2
  %exitcond.1120 = icmp eq i64 %indvars.iv.next115.1, %wide.trip.count116.1
  br i1 %exitcond.1120, label %for.cond33.loopexit.us.loopexit, label %for.body62.us.for.body62.us_crit_edge

for.body62.us.for.body62.us_crit_edge:            ; preds = %for.body62.us
  br label %for.body62.us

for.body42.us:                                    ; preds = %for.body42.us.for.body42.us_crit_edge, %for.body42.us.preheader
  %indvars.iv107 = phi i64 [ %indvars.iv.next108.1, %for.body42.us.for.body42.us_crit_edge ], [ %indvars.iv107.unr.ph, %for.body42.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv107, i64 %indvars.iv128
  %33 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv107, i64 %indvars.iv123
  %34 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %33, %34
  %35 = load double, double* %arrayidx39.us, align 8
  %add56.us = fadd double %35, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next108, i64 %indvars.iv128
  %36 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next108, i64 %indvars.iv123
  %37 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %36, %37
  %38 = load double, double* %arrayidx39.us, align 8
  %add56.us.1 = fadd double %38, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next108.1 = add nuw nsw i64 %indvars.iv107, 2
  %exitcond.1113 = icmp eq i64 %indvars.iv.next108.1, %wide.trip.count109.1
  br i1 %exitcond.1113, label %for.cond40.for.cond60.preheader_crit_edge.us.loopexit, label %for.body42.us.for.body42.us_crit_edge

for.body42.us.for.body42.us_crit_edge:            ; preds = %for.body42.us
  br label %for.body42.us

for.cond40.for.cond60.preheader_crit_edge.us.loopexit: ; preds = %for.body42.us
  br label %for.cond40.for.cond60.preheader_crit_edge.us

for.cond40.for.cond60.preheader_crit_edge.us:     ; preds = %for.body42.us.prol.loopexit.for.cond40.for.cond60.preheader_crit_edge.us_crit_edge, %for.cond40.for.cond60.preheader_crit_edge.us.loopexit
  br i1 %cmp6157, label %for.body62.us.preheader, label %for.cond40.for.cond60.preheader_crit_edge.us.for.cond33.loopexit.us_crit_edge

for.cond40.for.cond60.preheader_crit_edge.us.for.cond33.loopexit.us_crit_edge: ; preds = %for.cond40.for.cond60.preheader_crit_edge.us
  br label %for.cond33.loopexit.us

for.body62.us.preheader:                          ; preds = %for.cond40.for.cond60.preheader_crit_edge.us
  br i1 %lcmp.mod118, label %for.body62.us.preheader.for.body62.us.prol.loopexit_crit_edge, label %for.body62.us.prol

for.body62.us.preheader.for.body62.us.prol.loopexit_crit_edge: ; preds = %for.body62.us.preheader
  br label %for.body62.us.prol.loopexit

for.body62.us.prol:                               ; preds = %for.body62.us.preheader
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv123
  %39 = load double, double* %arrayidx66.us.prol, align 8
  %40 = load double, double* %arrayidx70.us.prol, align 8
  %41 = load double, double* %arrayidx39.us, align 8
  %mul75.us.prol = fmul double %40, %41
  %sub.us.prol = fsub double %39, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.body62.us.prol.loopexit

for.body62.us.prol.loopexit:                      ; preds = %for.body62.us.preheader.for.body62.us.prol.loopexit_crit_edge, %for.body62.us.prol
  %indvars.iv114.unr.ph = phi i64 [ 1, %for.body62.us.prol ], [ 0, %for.body62.us.preheader.for.body62.us.prol.loopexit_crit_edge ]
  br i1 %7, label %for.body62.us.prol.loopexit.for.cond33.loopexit.us_crit_edge, label %for.body62.us.preheader136

for.body62.us.prol.loopexit.for.cond33.loopexit.us_crit_edge: ; preds = %for.body62.us.prol.loopexit
  br label %for.cond33.loopexit.us

for.body62.us.preheader136:                       ; preds = %for.body62.us.prol.loopexit
  br label %for.body62.us

for.body16:                                       ; preds = %for.body16.for.body16_crit_edge, %for.body16.preheader137
  %indvars.iv95 = phi i64 [ %indvars.iv.next96.1, %for.body16.for.body16_crit_edge ], [ %indvars.iv95.unr.ph, %for.body16.preheader137 ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv128
  %42 = load double, double* %arrayidx20, align 8
  %43 = load double, double* %arrayidx13, align 8
  %div = fdiv double %42, %43
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv95, i64 %indvars.iv128
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next96, i64 %indvars.iv128
  %44 = load double, double* %arrayidx20.1, align 8
  %45 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %44, %45
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next96, i64 %indvars.iv128
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next96.1 = add nuw nsw i64 %indvars.iv95, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next96.1, %wide.trip.count97.1
  br i1 %exitcond.1, label %for.cond33.preheader.loopexit, label %for.body16.for.body16_crit_edge

for.body16.for.body16_crit_edge:                  ; preds = %for.body16
  br label %for.body16

for.inc86.loopexit94:                             ; preds = %for.body35.lr.ph
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep106, i8 0, i64 %16, i32 8, i1 false)
  br label %for.inc86

for.inc86.loopexit:                               ; preds = %for.cond33.loopexit.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.cond33.preheader.for.inc86_crit_edge, %for.inc86.loopexit, %for.inc86.loopexit94
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next129, %wide.trip.count130
  br i1 %exitcond131, label %for.end88.loopexit, label %for.inc86.for.cond1.preheader_crit_edge

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
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %R, [1200 x double]* nocapture readonly %Q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp25 = icmp sgt i32 %n, 0
  br i1 %cmp25, label %for.cond2.preheader.us.preheader, label %entry.for.end12_crit_edge

entry.for.end12_crit_edge:                        ; preds = %entry
  br label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count38 = zext i32 %n to i64
  %wide.trip.count43 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge, %for.cond2.preheader.us.preheader
  %indvars.iv40 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next41, %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge ]
  %4 = mul nsw i64 %indvars.iv40, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us.for.body4.us_crit_edge, %for.cond2.preheader.us
  %indvars.iv35 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next36, %if.end.us.for.body4.us_crit_edge ]
  %5 = add nsw i64 %indvars.iv35, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.if.end.us_crit_edge

for.body4.us.if.end.us_crit_edge:                 ; preds = %for.body4.us
  br label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us.if.end.us_crit_edge, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv40, i64 %indvars.iv35
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next36, %wide.trip.count38
  br i1 %exitcond39, label %for.cond2.for.inc10_crit_edge.us, label %if.end.us.for.body4.us_crit_edge

if.end.us.for.body4.us_crit_edge:                 ; preds = %if.end.us
  br label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next41, %wide.trip.count43
  br i1 %exitcond44, label %for.end12.loopexit, label %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge

for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge: ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %entry.for.end12_crit_edge, %for.end12.loopexit
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %cmp1621 = icmp sgt i32 %m, 0
  %cmp1919 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp1621, %cmp1919
  br i1 %or.cond, label %for.cond18.preheader.us.preheader, label %for.end12.for.end38_crit_edge

for.end12.for.end38_crit_edge:                    ; preds = %for.end12
  br label %for.end38

for.cond18.preheader.us.preheader:                ; preds = %for.end12
  %12 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count32 = zext i32 %m to i64
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.for.inc36_crit_edge.us.for.cond18.preheader.us_crit_edge, %for.cond18.preheader.us.preheader
  %indvars.iv29 = phi i64 [ 0, %for.cond18.preheader.us.preheader ], [ %indvars.iv.next30, %for.cond18.for.inc36_crit_edge.us.for.cond18.preheader.us_crit_edge ]
  %13 = mul nsw i64 %indvars.iv29, %12
  br label %for.body20.us

for.body20.us:                                    ; preds = %if.end27.us.for.body20.us_crit_edge, %for.cond18.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next, %if.end27.us.for.body20.us_crit_edge ]
  %14 = add nsw i64 %indvars.iv, %13
  %15 = trunc i64 %14 to i32
  %rem23.us = srem i32 %15, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %for.body20.us.if.end27.us_crit_edge

for.body20.us.if.end27.us_crit_edge:              ; preds = %for.body20.us
  br label %if.end27.us

if.then25.us:                                     ; preds = %for.body20.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %if.end27.us

if.end27.us:                                      ; preds = %for.body20.us.if.end27.us_crit_edge, %if.then25.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv29, i64 %indvars.iv
  %18 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond18.for.inc36_crit_edge.us, label %if.end27.us.for.body20.us_crit_edge

if.end27.us.for.body20.us_crit_edge:              ; preds = %if.end27.us
  br label %for.body20.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %if.end27.us
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next30, %wide.trip.count32
  br i1 %exitcond33, label %for.end38.loopexit, label %for.cond18.for.inc36_crit_edge.us.for.cond18.preheader.us_crit_edge

for.cond18.for.inc36_crit_edge.us.for.cond18.preheader.us_crit_edge: ; preds = %for.cond18.for.inc36_crit_edge.us
  br label %for.cond18.preheader.us

for.end38.loopexit:                               ; preds = %for.cond18.for.inc36_crit_edge.us
  br label %for.end38

for.end38:                                        ; preds = %for.end12.for.end38_crit_edge, %for.end38.loopexit
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
