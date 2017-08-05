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
  %arraydecay14 = bitcast i8* %call to [1200 x double]*
  %arraydecay315 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay416 = bitcast i8* %call2 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %arraydecay14, [1200 x double]* %arraydecay315, [1200 x double]* %arraydecay416)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %arraydecay14, [1200 x double]* %arraydecay315, [1200 x double]* %arraydecay416)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay315, [1200 x double]* %arraydecay416)
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
  %cmp23 = icmp sgt i32 %m, 0
  br i1 %cmp23, label %for.cond1.preheader.lr.ph, label %for.cond15.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp221 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  br i1 %cmp221, label %for.cond1.preheader.us.preheader, label %for.end32

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = zext i32 %n to i64
  %1 = zext i32 %m to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc12_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv36 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next37, %for.cond1.for.inc12_crit_edge.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv31 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next32, %for.inc.us ]
  %2 = mul nuw nsw i64 %indvars.iv31, %indvars.iv36
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv31
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv36, i64 %indvars.iv31
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond = icmp eq i64 %indvars.iv.next32, %0
  br i1 %exitcond, label %for.cond1.for.inc12_crit_edge.us, label %for.inc.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next37, %1
  br i1 %exitcond45, label %for.cond15.preheader.loopexit, label %for.cond1.preheader.us

for.cond15.preheader.loopexit:                    ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  %cmp1619 = icmp sgt i32 %n, 0
  br i1 %cmp1619, label %for.cond19.preheader.us.preheader, label %for.end32

for.cond19.preheader.us.preheader:                ; preds = %for.cond15.preheader
  %4 = zext i32 %n to i64
  %5 = shl nuw nsw i64 %4, 3
  %6 = add nsw i64 %4, -1
  %xtraiter = and i64 %4, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond19.preheader.us.prol.loopexit, label %for.cond19.for.inc30_crit_edge.us.prol.preheader

for.cond19.for.inc30_crit_edge.us.prol.preheader: ; preds = %for.cond19.preheader.us.preheader
  br label %for.cond19.for.inc30_crit_edge.us.prol

for.cond19.for.inc30_crit_edge.us.prol:           ; preds = %for.cond19.for.inc30_crit_edge.us.prol.preheader, %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge
  %indvars.iv27.prol = phi i64 [ %indvars.iv.next28.prol, %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge ], [ 0, %for.cond19.for.inc30_crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge ], [ %xtraiter, %for.cond19.for.inc30_crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv27.prol, i64 0
  %scevgep41.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep41.prol, i8 0, i64 %5, i32 8, i1 false)
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond19.preheader.us.prol.loopexit.loopexit, label %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge, !llvm.loop !1

for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge: ; preds = %for.cond19.for.inc30_crit_edge.us.prol
  %indvars.iv.next28.prol = add nuw nsw i64 %indvars.iv27.prol, 1
  br label %for.cond19.for.inc30_crit_edge.us.prol

for.cond19.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond19.for.inc30_crit_edge.us.prol
  br label %for.cond19.preheader.us.prol.loopexit

for.cond19.preheader.us.prol.loopexit:            ; preds = %for.cond19.preheader.us.prol.loopexit.loopexit, %for.cond19.preheader.us.preheader
  %indvars.iv27.unr = phi i64 [ 0, %for.cond19.preheader.us.preheader ], [ %xtraiter, %for.cond19.preheader.us.prol.loopexit.loopexit ]
  %7 = icmp ult i64 %6, 3
  br i1 %7, label %for.end32, label %for.cond19.for.inc30_crit_edge.us.3.preheader

for.cond19.for.inc30_crit_edge.us.3.preheader:    ; preds = %for.cond19.preheader.us.prol.loopexit
  %8 = add nsw i64 %4, -4
  %9 = sub nsw i64 %8, %indvars.iv27.unr
  %10 = lshr i64 %9, 2
  %11 = and i64 %10, 1
  %lcmp.mod47 = icmp eq i64 %11, 0
  br i1 %lcmp.mod47, label %for.cond19.for.inc30_crit_edge.us.3.prol.preheader, label %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit

for.cond19.for.inc30_crit_edge.us.3.prol.preheader: ; preds = %for.cond19.for.inc30_crit_edge.us.3.preheader
  br label %for.cond19.for.inc30_crit_edge.us.3.prol

for.cond19.for.inc30_crit_edge.us.3.prol:         ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.preheader
  %scevgep.prol49 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv27.unr, i64 0
  %scevgep41.prol50 = bitcast double* %scevgep.prol49 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep41.prol50, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next28.prol51 = add nuw nsw i64 %indvars.iv27.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next28.prol51, i64 0
  %scevgep41.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep41.1.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next28.1.prol = add nuw nsw i64 %indvars.iv27.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next28.1.prol, i64 0
  %scevgep41.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep41.2.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next28.2.prol = add nuw nsw i64 %indvars.iv27.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next28.2.prol, i64 0
  %scevgep41.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep41.3.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next28.3.prol = or i64 %indvars.iv27.unr, 4
  br label %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit

for.cond19.for.inc30_crit_edge.us.3.prol.loopexit: ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol, %for.cond19.for.inc30_crit_edge.us.3.preheader
  %indvars.iv27.unr52 = phi i64 [ %indvars.iv27.unr, %for.cond19.for.inc30_crit_edge.us.3.preheader ], [ %indvars.iv.next28.3.prol, %for.cond19.for.inc30_crit_edge.us.3.prol ]
  %12 = icmp eq i64 %10, 0
  br i1 %12, label %for.end32.loopexit, label %for.cond19.for.inc30_crit_edge.us.3.preheader.new

for.cond19.for.inc30_crit_edge.us.3.preheader.new: ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit
  br label %for.cond19.for.inc30_crit_edge.us.3

for.end32.loopexit.unr-lcssa:                     ; preds = %for.cond19.for.inc30_crit_edge.us.3
  br label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit, %for.end32.loopexit.unr-lcssa
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %for.cond19.preheader.us.prol.loopexit, %for.cond15.preheader, %for.cond1.preheader.lr.ph
  ret void

for.cond19.for.inc30_crit_edge.us.3:              ; preds = %for.cond19.for.inc30_crit_edge.us.3, %for.cond19.for.inc30_crit_edge.us.3.preheader.new
  %indvars.iv27 = phi i64 [ %indvars.iv27.unr52, %for.cond19.for.inc30_crit_edge.us.3.preheader.new ], [ %indvars.iv.next28.3.1, %for.cond19.for.inc30_crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv27, i64 0
  %scevgep41 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep41, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next28, i64 0
  %scevgep41.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep41.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next28.1, i64 0
  %scevgep41.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep41.2, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next28.2 = add nsw i64 %indvars.iv27, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next28.2, i64 0
  %scevgep41.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep41.3, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next28.3 = add nsw i64 %indvars.iv27, 4
  %scevgep.153 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next28.3, i64 0
  %scevgep41.154 = bitcast double* %scevgep.153 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep41.154, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next28.155 = add nsw i64 %indvars.iv27, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next28.155, i64 0
  %scevgep41.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep41.1.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next28.1.1 = add nsw i64 %indvars.iv27, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next28.1.1, i64 0
  %scevgep41.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep41.2.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next28.2.1 = add nsw i64 %indvars.iv27, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next28.2.1, i64 0
  %scevgep41.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep41.3.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next28.3.1 = add nsw i64 %indvars.iv27, 8
  %exitcond30.3.1 = icmp eq i64 %indvars.iv.next28.3.1, %4
  br i1 %exitcond30.3.1, label %for.end32.loopexit.unr-lcssa, label %for.cond19.for.inc30_crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  %cmp92 = icmp sgt i32 %n, 0
  br i1 %cmp92, label %for.cond1.preheader.lr.ph, label %for.end88

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp250 = icmp sgt i32 %m, 0
  %0 = add i32 %m, -1
  %1 = sext i32 %n to i64
  %2 = zext i32 %m to i64
  %3 = add nsw i64 %2, -1
  %4 = zext i32 %n to i64
  %5 = shl nuw nsw i64 %4, 3
  %6 = add nsw i64 %5, -8
  %7 = zext i32 %0 to i64
  %xtraiter = and i64 %2, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %8 = icmp ult i64 %3, 3
  %xtraiter127 = and i64 %2, 1
  %lcmp.mod128 = icmp eq i64 %xtraiter127, 0
  %9 = icmp eq i64 %3, 0
  %10 = add nsw i64 %7, -1
  %exitcond139 = icmp eq i32 %0, 0
  %xtraiter147 = and i64 %7, 1
  %lcmp.mod148 = icmp eq i64 %xtraiter147, 0
  %11 = icmp eq i64 %10, 0
  %exitcond134145 = icmp eq i32 %0, 0
  %xtraiter149 = and i64 %7, 1
  %lcmp.mod150 = icmp eq i64 %xtraiter149, 0
  %12 = icmp eq i64 %10, 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc86.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv121 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %13, %for.inc86.for.cond1.preheader_crit_edge ]
  %indvars.iv115 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next116, %for.inc86.for.cond1.preheader_crit_edge ]
  %13 = add nuw nsw i64 %indvars.iv121, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %13
  %14 = mul i64 %indvars.iv121, -8
  %15 = add i64 %6, %14
  br i1 %cmp250, label %for.inc.lr.ph, label %for.end.thread

for.end.thread:                                   ; preds = %for.cond1.preheader
  %arrayidx13133 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv121, i64 %indvars.iv121
  store double 0.000000e+00, double* %arrayidx13133, align 8
  br label %for.cond33.preheader

for.inc.lr.ph:                                    ; preds = %for.cond1.preheader
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol.for.inc.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0, %for.inc.prol.preheader ]
  %nrm.051.prol = phi double [ %add.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0.000000e+00, %for.inc.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc.prol.for.inc.prol_crit_edge ], [ %xtraiter, %for.inc.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.prol, i64 %indvars.iv121
  %16 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %16, %16
  %add.prol = fadd double %nrm.051.prol, %mul.prol
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol.for.inc.prol_crit_edge, !llvm.loop !3

for.inc.prol.for.inc.prol_crit_edge:              ; preds = %for.inc.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.inc.prol

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %xtraiter, %for.inc.prol.loopexit.loopexit ]
  %nrm.051.unr = phi double [ 0.000000e+00, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  br i1 %8, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc ], [ %indvars.iv.unr, %for.inc.preheader ]
  %nrm.051 = phi double [ %add.3, %for.inc ], [ %nrm.051.unr, %for.inc.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv121
  %17 = load double, double* %arrayidx5, align 8
  %mul = fmul double %17, %17
  %add = fadd double %nrm.051, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv121
  %18 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %18, %18
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv121
  %19 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %19, %19
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv121
  %20 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %20, %20
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %2
  br i1 %exitcond.3, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit
  %nrm.0.lcssa = phi double [ %add.lcssa.unr, %for.inc.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %nrm.0.lcssa) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv121, i64 %indvars.iv121
  store double %call, double* %arrayidx13, align 8
  %arrayidx20136 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv121
  %21 = load double, double* %arrayidx20136, align 8
  %div137 = fdiv double %21, %call
  %arrayidx28138 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv121
  store double %div137, double* %arrayidx28138, align 8
  br i1 %exitcond139, label %for.cond33.preheader, label %for.inc29.for.inc29_crit_edge.preheader

for.inc29.for.inc29_crit_edge.preheader:          ; preds = %for.end
  br i1 %lcmp.mod148, label %for.inc29.for.inc29_crit_edge.prol.loopexit.unr-lcssa, label %for.inc29.for.inc29_crit_edge.prol.preheader

for.inc29.for.inc29_crit_edge.prol.preheader:     ; preds = %for.inc29.for.inc29_crit_edge.preheader
  br label %for.inc29.for.inc29_crit_edge.prol

for.inc29.for.inc29_crit_edge.prol:               ; preds = %for.inc29.for.inc29_crit_edge.prol.preheader
  %.pre.prol = load double, double* %arrayidx13, align 8
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 1, i64 %indvars.iv121
  %22 = load double, double* %arrayidx20.prol, align 8
  %div.prol = fdiv double %22, %.pre.prol
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 1, i64 %indvars.iv121
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.inc29.for.inc29_crit_edge.prol.loopexit.unr-lcssa

for.inc29.for.inc29_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.inc29.for.inc29_crit_edge.preheader, %for.inc29.for.inc29_crit_edge.prol
  %indvars.iv97140.unr.ph = phi i64 [ 1, %for.inc29.for.inc29_crit_edge.prol ], [ 0, %for.inc29.for.inc29_crit_edge.preheader ]
  br label %for.inc29.for.inc29_crit_edge.prol.loopexit

for.inc29.for.inc29_crit_edge.prol.loopexit:      ; preds = %for.inc29.for.inc29_crit_edge.prol.loopexit.unr-lcssa
  br i1 %11, label %for.cond33.preheader.loopexit, label %for.inc29.for.inc29_crit_edge.preheader.new

for.inc29.for.inc29_crit_edge.preheader.new:      ; preds = %for.inc29.for.inc29_crit_edge.prol.loopexit
  br label %for.inc29.for.inc29_crit_edge

for.cond33.preheader.loopexit.unr-lcssa:          ; preds = %for.inc29.for.inc29_crit_edge
  br label %for.cond33.preheader.loopexit

for.cond33.preheader.loopexit:                    ; preds = %for.inc29.for.inc29_crit_edge.prol.loopexit, %for.cond33.preheader.loopexit.unr-lcssa
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.cond33.preheader.loopexit, %for.end, %for.end.thread
  %cmp3460 = icmp slt i64 %13, %1
  br i1 %cmp3460, label %for.body35.lr.ph, label %for.inc86

for.body35.lr.ph:                                 ; preds = %for.cond33.preheader
  br i1 %cmp250, label %for.body35.us.preheader, label %for.inc86.loopexit94

for.body35.us.preheader:                          ; preds = %for.body35.lr.ph
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv121
  %arrayidx70.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 1, i64 %indvars.iv121
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.cond33.loopexit.us, %for.body35.us.preheader
  %indvars.iv117 = phi i64 [ %indvars.iv115, %for.body35.us.preheader ], [ %indvars.iv.next118, %for.cond33.loopexit.us ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv121, i64 %indvars.iv117
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 %lcmp.mod128, label %for.inc57.us.prol.loopexit, label %for.inc57.us.prol

for.inc57.us.prol:                                ; preds = %for.body35.us
  %23 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv117
  %24 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %23, %24
  %add56.us.prol = fadd double %mul51.us.prol, 0.000000e+00
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.inc57.us.prol.loopexit

for.inc57.us.prol.loopexit:                       ; preds = %for.body35.us, %for.inc57.us.prol
  %indvars.iv107.unr.ph = phi i64 [ 1, %for.inc57.us.prol ], [ 0, %for.body35.us ]
  %.unr.ph = phi double [ %add56.us.prol, %for.inc57.us.prol ], [ 0.000000e+00, %for.body35.us ]
  %add56.us.lcssa.unr.ph = phi double [ %add56.us.prol, %for.inc57.us.prol ], [ undef, %for.body35.us ]
  br i1 %9, label %for.inc80.us.preheader, label %for.inc57.us.preheader

for.inc57.us.preheader:                           ; preds = %for.inc57.us.prol.loopexit
  br label %for.inc57.us

for.inc80.us.preheader.loopexit:                  ; preds = %for.inc57.us
  br label %for.inc80.us.preheader

for.inc80.us.preheader:                           ; preds = %for.inc80.us.preheader.loopexit, %for.inc57.us.prol.loopexit
  %.ph = phi double [ %add56.us.lcssa.unr.ph, %for.inc57.us.prol.loopexit ], [ %add56.us.1, %for.inc80.us.preheader.loopexit ]
  %arrayidx66.us141 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv117
  %25 = load double, double* %arrayidx66.us141, align 8
  %26 = load double, double* %arrayidx46.us.prol, align 8
  %mul75.us143 = fmul double %26, %.ph
  %sub.us144 = fsub double %25, %mul75.us143
  store double %sub.us144, double* %arrayidx66.us141, align 8
  br i1 %exitcond134145, label %for.cond33.loopexit.us, label %for.inc80.us.for.inc80.us_crit_edge.preheader

for.inc80.us.for.inc80.us_crit_edge.preheader:    ; preds = %for.inc80.us.preheader
  br i1 %lcmp.mod150, label %for.inc80.us.for.inc80.us_crit_edge.prol.loopexit.unr-lcssa, label %for.inc80.us.for.inc80.us_crit_edge.prol.preheader

for.inc80.us.for.inc80.us_crit_edge.prol.preheader: ; preds = %for.inc80.us.for.inc80.us_crit_edge.preheader
  br label %for.inc80.us.for.inc80.us_crit_edge.prol

for.inc80.us.for.inc80.us_crit_edge.prol:         ; preds = %for.inc80.us.for.inc80.us_crit_edge.prol.preheader
  %.pre95.prol = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 1, i64 %indvars.iv117
  %27 = load double, double* %arrayidx66.us.prol, align 8
  %28 = load double, double* %arrayidx70.us.prol, align 8
  %mul75.us.prol = fmul double %28, %.pre95.prol
  %sub.us.prol = fsub double %27, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.inc80.us.for.inc80.us_crit_edge.prol.loopexit.unr-lcssa

for.inc80.us.for.inc80.us_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.inc80.us.for.inc80.us_crit_edge.preheader, %for.inc80.us.for.inc80.us_crit_edge.prol
  %indvars.iv111146.unr.ph = phi i64 [ 1, %for.inc80.us.for.inc80.us_crit_edge.prol ], [ 0, %for.inc80.us.for.inc80.us_crit_edge.preheader ]
  br label %for.inc80.us.for.inc80.us_crit_edge.prol.loopexit

for.inc80.us.for.inc80.us_crit_edge.prol.loopexit: ; preds = %for.inc80.us.for.inc80.us_crit_edge.prol.loopexit.unr-lcssa
  br i1 %12, label %for.cond33.loopexit.us.loopexit, label %for.inc80.us.for.inc80.us_crit_edge.preheader.new

for.inc80.us.for.inc80.us_crit_edge.preheader.new: ; preds = %for.inc80.us.for.inc80.us_crit_edge.prol.loopexit
  br label %for.inc80.us.for.inc80.us_crit_edge

for.inc80.us.for.inc80.us_crit_edge:              ; preds = %for.inc80.us.for.inc80.us_crit_edge, %for.inc80.us.for.inc80.us_crit_edge.preheader.new
  %indvars.iv111146 = phi i64 [ %indvars.iv111146.unr.ph, %for.inc80.us.for.inc80.us_crit_edge.preheader.new ], [ %indvars.iv.next112.1, %for.inc80.us.for.inc80.us_crit_edge ]
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111146, 1
  %.pre95 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next112, i64 %indvars.iv117
  %29 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next112, i64 %indvars.iv121
  %30 = load double, double* %arrayidx70.us, align 8
  %mul75.us = fmul double %30, %.pre95
  %sub.us = fsub double %29, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next112.1 = add nsw i64 %indvars.iv111146, 2
  %.pre95.1 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next112.1, i64 %indvars.iv117
  %31 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next112.1, i64 %indvars.iv121
  %32 = load double, double* %arrayidx70.us.1, align 8
  %mul75.us.1 = fmul double %32, %.pre95.1
  %sub.us.1 = fsub double %31, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %exitcond134.1 = icmp eq i64 %indvars.iv.next112.1, %7
  br i1 %exitcond134.1, label %for.cond33.loopexit.us.loopexit.unr-lcssa, label %for.inc80.us.for.inc80.us_crit_edge

for.inc57.us:                                     ; preds = %for.inc57.us.preheader, %for.inc57.us
  %indvars.iv107 = phi i64 [ %indvars.iv.next108.1, %for.inc57.us ], [ %indvars.iv107.unr.ph, %for.inc57.us.preheader ]
  %33 = phi double [ %add56.us.1, %for.inc57.us ], [ %.unr.ph, %for.inc57.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv107, i64 %indvars.iv121
  %34 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv107, i64 %indvars.iv117
  %35 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %34, %35
  %add56.us = fadd double %33, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next108, i64 %indvars.iv121
  %36 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next108, i64 %indvars.iv117
  %37 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %36, %37
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next108.1 = add nuw nsw i64 %indvars.iv107, 2
  %exitcond110.1 = icmp eq i64 %indvars.iv.next108.1, %2
  br i1 %exitcond110.1, label %for.inc80.us.preheader.loopexit, label %for.inc57.us

for.cond33.loopexit.us.loopexit.unr-lcssa:        ; preds = %for.inc80.us.for.inc80.us_crit_edge
  br label %for.cond33.loopexit.us.loopexit

for.cond33.loopexit.us.loopexit:                  ; preds = %for.inc80.us.for.inc80.us_crit_edge.prol.loopexit, %for.cond33.loopexit.us.loopexit.unr-lcssa
  br label %for.cond33.loopexit.us

for.cond33.loopexit.us:                           ; preds = %for.cond33.loopexit.us.loopexit, %for.inc80.us.preheader
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next118, %4
  br i1 %exitcond135, label %for.inc86.loopexit, label %for.body35.us

for.inc29.for.inc29_crit_edge:                    ; preds = %for.inc29.for.inc29_crit_edge, %for.inc29.for.inc29_crit_edge.preheader.new
  %indvars.iv97140 = phi i64 [ %indvars.iv97140.unr.ph, %for.inc29.for.inc29_crit_edge.preheader.new ], [ %indvars.iv.next98.1, %for.inc29.for.inc29_crit_edge ]
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97140, 1
  %.pre = load double, double* %arrayidx13, align 8
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next98, i64 %indvars.iv121
  %38 = load double, double* %arrayidx20, align 8
  %div = fdiv double %38, %.pre
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next98, i64 %indvars.iv121
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97140, 2
  %.pre.1 = load double, double* %arrayidx13, align 8
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next98.1, i64 %indvars.iv121
  %39 = load double, double* %arrayidx20.1, align 8
  %div.1 = fdiv double %39, %.pre.1
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next98.1, i64 %indvars.iv121
  store double %div.1, double* %arrayidx28.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next98.1, %7
  br i1 %exitcond.1, label %for.cond33.preheader.loopexit.unr-lcssa, label %for.inc29.for.inc29_crit_edge

for.inc86.loopexit94:                             ; preds = %for.body35.lr.ph
  %40 = mul i64 %indvars.iv121, 1200
  %scevgep125 = getelementptr double, double* %scevgep, i64 %40
  %scevgep125126 = bitcast double* %scevgep125 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep125126, i8 0, i64 %15, i32 8, i1 false)
  br label %for.inc86

for.inc86.loopexit:                               ; preds = %for.cond33.loopexit.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit, %for.cond33.preheader, %for.inc86.loopexit94
  %exitcond124 = icmp eq i64 %13, %4
  br i1 %exitcond124, label %for.end88.loopexit, label %for.inc86.for.cond1.preheader_crit_edge

for.inc86.for.cond1.preheader_crit_edge:          ; preds = %for.inc86
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  br label %for.cond1.preheader

for.end88.loopexit:                               ; preds = %for.inc86
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp7 = icmp sgt i32 %n, 0
  br i1 %cmp7, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv22 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next23, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv22, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv17 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next18, %for.inc.us ]
  %6 = add nsw i64 %indvars.iv17, %5
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv22, i64 %indvars.iv17
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #7
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next18, %4
  br i1 %exitcond28, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next23, %4
  br i1 %exitcond29, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %cmp163.not = icmp slt i32 %m, 1
  %cmp7.not = xor i1 %cmp7, true
  %brmerge = or i1 %cmp163.not, %cmp7.not
  br i1 %brmerge, label %for.end38, label %for.cond18.preheader.us.preheader

for.cond18.preheader.us.preheader:                ; preds = %for.end12
  %13 = sext i32 %n to i64
  %14 = zext i32 %n to i64
  %15 = zext i32 %m to i64
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.for.inc36_crit_edge.us, %for.cond18.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %for.cond18.preheader.us.preheader ], [ %indvars.iv.next12, %for.cond18.for.inc36_crit_edge.us ]
  %16 = mul nsw i64 %indvars.iv11, %13
  br label %for.body20.us

for.body20.us:                                    ; preds = %for.inc33.us, %for.cond18.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next, %for.inc33.us ]
  %17 = add nsw i64 %indvars.iv, %16
  %18 = trunc i64 %17 to i32
  %rem23.us = srem i32 %18, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %for.inc33.us

if.then25.us:                                     ; preds = %for.body20.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #6
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.body20.us, %if.then25.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv11, i64 %indvars.iv
  %21 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next, %14
  br i1 %exitcond27, label %for.cond18.for.inc36_crit_edge.us, label %for.body20.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %for.inc33.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, %15
  br i1 %exitcond, label %for.end38.loopexit, label %for.cond18.preheader.us

for.end38.loopexit:                               ; preds = %for.cond18.for.inc36_crit_edge.us
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.end12
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
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
