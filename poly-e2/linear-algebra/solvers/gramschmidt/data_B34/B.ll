; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  tail call void @init_array(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  %1 = bitcast i8* %call2 to [1200 x double]*
  %2 = bitcast i8* %call1 to [1200 x double]*
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %2, [1200 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) #2 {
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
  %indvars.iv34 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next35, %for.cond1.for.inc12_crit_edge.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv28 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next29, %for.inc.us ]
  %2 = mul nuw nsw i64 %indvars.iv28, %indvars.iv34
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv28
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv34, i64 %indvars.iv28
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next29, %0
  br i1 %exitcond40, label %for.cond1.for.inc12_crit_edge.us, label %for.inc.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next35, %1
  br i1 %exitcond, label %for.cond15.preheader.loopexit, label %for.cond1.preheader.us

for.cond15.preheader.loopexit:                    ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  %cmp1619 = icmp sgt i32 %n, 0
  br i1 %cmp1619, label %for.cond19.preheader.us.preheader, label %for.end32

for.cond19.preheader.us.preheader:                ; preds = %for.cond15.preheader
  %4 = add i32 %n, -1
  %5 = zext i32 %4 to i64
  %6 = shl nuw nsw i64 %5, 3
  %7 = add nuw nsw i64 %6, 8
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond19.preheader.us.prol.loopexit, label %for.cond19.for.inc30_crit_edge.us.prol.preheader

for.cond19.for.inc30_crit_edge.us.prol.preheader: ; preds = %for.cond19.preheader.us.preheader
  %8 = add nsw i32 %xtraiter, -1
  %9 = zext i32 %8 to i64
  br label %for.cond19.for.inc30_crit_edge.us.prol

for.cond19.for.inc30_crit_edge.us.prol:           ; preds = %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge, %for.cond19.for.inc30_crit_edge.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge ], [ 0, %for.cond19.for.inc30_crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge ], [ %xtraiter, %for.cond19.for.inc30_crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.prol, i64 0
  %scevgep27.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.prol, i8 0, i64 %7, i32 8, i1 false)
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond19.preheader.us.prol.loopexit.loopexit, label %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge, !llvm.loop !1

for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge: ; preds = %for.cond19.for.inc30_crit_edge.us.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.cond19.for.inc30_crit_edge.us.prol

for.cond19.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond19.for.inc30_crit_edge.us.prol
  %10 = add nuw nsw i64 %9, 1
  br label %for.cond19.preheader.us.prol.loopexit

for.cond19.preheader.us.prol.loopexit:            ; preds = %for.cond19.preheader.us.preheader, %for.cond19.preheader.us.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ %10, %for.cond19.preheader.us.prol.loopexit.loopexit ], [ 0, %for.cond19.preheader.us.preheader ]
  %11 = icmp ult i32 %4, 3
  br i1 %11, label %for.end32, label %for.cond19.for.inc30_crit_edge.us.3.preheader

for.cond19.for.inc30_crit_edge.us.3.preheader:    ; preds = %for.cond19.preheader.us.prol.loopexit
  %wide.trip.count.3 = zext i32 %n to i64
  %12 = add nsw i64 %wide.trip.count.3, -4
  %13 = sub nsw i64 %12, %indvars.iv.unr
  %14 = lshr i64 %13, 2
  %15 = and i64 %14, 1
  %lcmp.mod42 = icmp eq i64 %15, 0
  br i1 %lcmp.mod42, label %for.cond19.for.inc30_crit_edge.us.3.prol, label %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit

for.cond19.for.inc30_crit_edge.us.3.prol:         ; preds = %for.cond19.for.inc30_crit_edge.us.3.preheader
  %scevgep.prol44 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.unr, i64 0
  %scevgep27.prol45 = bitcast double* %scevgep.prol44 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.prol45, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.prol46 = add nuw nsw i64 %indvars.iv.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.prol46, i64 0
  %scevgep27.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.1.prol, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1.prol, i64 0
  %scevgep27.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.2.prol, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.2.prol = add nsw i64 %indvars.iv.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2.prol, i64 0
  %scevgep27.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.3.prol, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit

for.cond19.for.inc30_crit_edge.us.3.prol.loopexit: ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol, %for.cond19.for.inc30_crit_edge.us.3.preheader
  %indvars.iv.unr47 = phi i64 [ %indvars.iv.unr, %for.cond19.for.inc30_crit_edge.us.3.preheader ], [ %indvars.iv.next.3.prol, %for.cond19.for.inc30_crit_edge.us.3.prol ]
  %16 = icmp eq i64 %14, 0
  br i1 %16, label %for.end32, label %for.cond19.for.inc30_crit_edge.us.3.preheader.new

for.cond19.for.inc30_crit_edge.us.3.preheader.new: ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit
  br label %for.cond19.for.inc30_crit_edge.us.3

for.end32.loopexit:                               ; preds = %for.cond19.for.inc30_crit_edge.us.3
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit, %for.cond19.preheader.us.prol.loopexit, %for.cond15.preheader, %for.cond1.preheader.lr.ph
  ret void

for.cond19.for.inc30_crit_edge.us.3:              ; preds = %for.cond19.for.inc30_crit_edge.us.3, %for.cond19.for.inc30_crit_edge.us.3.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr47, %for.cond19.for.inc30_crit_edge.us.3.preheader.new ], [ %indvars.iv.next.3.1, %for.cond19.for.inc30_crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 0
  %scevgep27 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next, i64 0
  %scevgep27.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1, i64 0
  %scevgep27.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.2, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2, i64 0
  %scevgep27.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.3, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %scevgep.148 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.3, i64 0
  %scevgep27.149 = bitcast double* %scevgep.148 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.149, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.150 = add nsw i64 %indvars.iv, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.150, i64 0
  %scevgep27.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.1.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1.1, i64 0
  %scevgep27.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.2.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.2.1 = add nsw i64 %indvars.iv, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2.1, i64 0
  %scevgep27.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.3.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %wide.trip.count.3
  br i1 %exitcond.3.1, label %for.end32.loopexit, label %for.cond19.for.inc30_crit_edge.us.3
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) #0 {
entry:
  %cmp92 = icmp sgt i32 %n, 0
  br i1 %cmp92, label %for.cond1.preheader.lr.ph, label %for.end88

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = add i32 %m, -1
  %1 = add i32 %n, -2
  %2 = zext i32 %1 to i64
  %3 = sext i32 %n to i64
  %4 = and i32 %m, 3
  %5 = add nsw i32 %4, -1
  %6 = zext i32 %5 to i64
  %7 = add nuw nsw i64 %6, 1
  %8 = zext i32 %n to i64
  %wide.trip.count.3 = zext i32 %m to i64
  %xtraiter98 = and i32 %m, 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc86.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv128 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next129, %for.inc86.for.cond1.preheader_crit_edge ]
  %indvars.iv121 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next122, %for.inc86.for.cond1.preheader_crit_edge ]
  %9 = icmp sgt i32 %m, 0
  %10 = mul nuw nsw i64 %indvars.iv128, 1201
  %11 = add nuw nsw i64 %10, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %11
  %12 = sub i64 %2, %indvars.iv128
  %13 = shl i64 %12, 3
  %14 = and i64 %13, 34359738360
  %15 = add nuw nsw i64 %14, 8
  br i1 %9, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %for.cond1.preheader
  %16 = icmp eq i32 %4, 0
  br i1 %16, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol.for.inc.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0, %for.inc.prol.preheader ]
  %nrm.051.prol = phi double [ %add.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0.000000e+00, %for.inc.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.prol.for.inc.prol_crit_edge ], [ %4, %for.inc.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.prol, i64 %indvars.iv128
  %17 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %17, %17
  %add.prol = fadd double %nrm.051.prol, %mul.prol
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol.for.inc.prol_crit_edge, !llvm.loop !3

for.inc.prol.for.inc.prol_crit_edge:              ; preds = %for.inc.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.inc.prol

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %7, %for.inc.prol.loopexit.loopexit ]
  %nrm.051.unr = phi double [ 0.000000e+00, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %18 = icmp ult i32 %0, 3
  br i1 %18, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc ], [ %indvars.iv.unr, %for.inc.preheader ]
  %nrm.051 = phi double [ %add.3, %for.inc ], [ %nrm.051.unr, %for.inc.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv128
  %19 = load double, double* %arrayidx5, align 8
  %mul = fmul double %19, %19
  %add = fadd double %nrm.051, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv128
  %20 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %20, %20
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv128
  %21 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %21, %21
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv128
  %22 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %22, %22
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit, %for.cond1.preheader
  %nrm.0.lcssa = phi double [ 0.000000e+00, %for.cond1.preheader ], [ %add.lcssa.unr, %for.inc.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %23 = icmp sgt i32 %m, 0
  %call = tail call double @sqrt(double %nrm.0.lcssa) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv128, i64 %indvars.iv128
  store double %call, double* %arrayidx13, align 8
  br i1 %23, label %for.inc29.preheader, label %for.cond33.preheader

for.inc29.preheader:                              ; preds = %for.end
  %24 = icmp eq i32 %xtraiter98, 0
  br i1 %24, label %for.inc29.prol.loopexit, label %for.inc29.prol

for.inc29.prol:                                   ; preds = %for.inc29.preheader
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv128
  %25 = load double, double* %arrayidx20.prol, align 8
  %div.prol = fdiv double %25, %call
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv128
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.inc29.prol.loopexit

for.inc29.prol.loopexit:                          ; preds = %for.inc29.preheader, %for.inc29.prol
  %indvars.iv95.unr.ph = phi i64 [ 1, %for.inc29.prol ], [ 0, %for.inc29.preheader ]
  %26 = icmp eq i32 %0, 0
  br i1 %26, label %for.cond33.preheader, label %for.inc29.preheader138

for.inc29.preheader138:                           ; preds = %for.inc29.prol.loopexit
  br label %for.inc29

for.cond33.preheader.loopexit:                    ; preds = %for.inc29
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.cond33.preheader.loopexit, %for.inc29.prol.loopexit, %for.end
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %cmp3460 = icmp slt i64 %indvars.iv.next129, %3
  br i1 %cmp3460, label %for.body35.lr.ph, label %for.inc86

for.body35.lr.ph:                                 ; preds = %for.cond33.preheader
  %27 = icmp sgt i32 %m, 0
  br i1 %27, label %for.body35.us.preheader, label %for.inc86.loopexit94

for.body35.us.preheader:                          ; preds = %for.body35.lr.ph
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.cond33.loopexit.us, %for.body35.us.preheader
  %indvars.iv123 = phi i64 [ %indvars.iv121, %for.body35.us.preheader ], [ %indvars.iv.next124, %for.cond33.loopexit.us ]
  %28 = icmp eq i32 %xtraiter98, 0
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv128, i64 %indvars.iv123
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 %28, label %for.inc57.us.prol.loopexit, label %for.inc57.us.prol

for.inc57.us.prol:                                ; preds = %for.body35.us
  %sunkaddr = ptrtoint [1200 x double]* %Q to i64
  %sunkaddr139 = mul i64 %indvars.iv128, 8
  %sunkaddr140 = add i64 %sunkaddr, %sunkaddr139
  %sunkaddr141 = inttoptr i64 %sunkaddr140 to double*
  %29 = load double, double* %sunkaddr141, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv123
  %30 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %29, %30
  %add56.us.prol = fadd double %mul51.us.prol, 0.000000e+00
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.inc57.us.prol.loopexit

for.inc57.us.prol.loopexit:                       ; preds = %for.body35.us, %for.inc57.us.prol
  %31 = phi double [ %add56.us.prol, %for.inc57.us.prol ], [ 0.000000e+00, %for.body35.us ]
  %indvars.iv107.unr.ph = phi i64 [ 1, %for.inc57.us.prol ], [ 0, %for.body35.us ]
  %32 = icmp eq i32 %0, 0
  br i1 %32, label %for.inc80.us.preheader, label %for.inc57.us.preheader

for.inc57.us.preheader:                           ; preds = %for.inc57.us.prol.loopexit
  br label %for.inc57.us

for.inc80.us:                                     ; preds = %for.inc80.us.preheader137, %for.inc80.us
  %indvars.iv114 = phi i64 [ %indvars.iv.next115.1, %for.inc80.us ], [ %indvars.iv114.unr.ph, %for.inc80.us.preheader137 ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv114, i64 %indvars.iv123
  %33 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv114, i64 %indvars.iv128
  %34 = load double, double* %arrayidx70.us, align 8
  %35 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %34, %35
  %sub.us = fsub double %33, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next115, i64 %indvars.iv123
  %36 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next115, i64 %indvars.iv128
  %37 = load double, double* %arrayidx70.us.1, align 8
  %38 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %37, %38
  %sub.us.1 = fsub double %36, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next115.1 = add nuw nsw i64 %indvars.iv114, 2
  %exitcond.1120 = icmp eq i64 %indvars.iv.next115.1, %wide.trip.count.3
  br i1 %exitcond.1120, label %for.cond33.loopexit.us.loopexit, label %for.inc80.us

for.inc57.us:                                     ; preds = %for.inc57.us.preheader, %for.inc57.us
  %39 = phi double [ %add56.us.1, %for.inc57.us ], [ %31, %for.inc57.us.preheader ]
  %indvars.iv107 = phi i64 [ %indvars.iv.next108.1, %for.inc57.us ], [ %indvars.iv107.unr.ph, %for.inc57.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv107, i64 %indvars.iv128
  %40 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv107, i64 %indvars.iv123
  %41 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %40, %41
  %add56.us = fadd double %39, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next108, i64 %indvars.iv128
  %42 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next108, i64 %indvars.iv123
  %43 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %42, %43
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next108.1 = add nuw nsw i64 %indvars.iv107, 2
  %exitcond.1113 = icmp eq i64 %indvars.iv.next108.1, %wide.trip.count.3
  br i1 %exitcond.1113, label %for.inc80.us.preheader.loopexit, label %for.inc57.us

for.cond33.loopexit.us.loopexit:                  ; preds = %for.inc80.us
  br label %for.cond33.loopexit.us

for.cond33.loopexit.us:                           ; preds = %for.cond33.loopexit.us.loopexit, %for.inc80.us.prol.loopexit
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next124, %8
  br i1 %exitcond134, label %for.inc86.loopexit, label %for.body35.us

for.inc80.us.preheader.loopexit:                  ; preds = %for.inc57.us
  br label %for.inc80.us.preheader

for.inc80.us.preheader:                           ; preds = %for.inc80.us.preheader.loopexit, %for.inc57.us.prol.loopexit
  %44 = phi double [ %31, %for.inc57.us.prol.loopexit ], [ %add56.us.1, %for.inc80.us.preheader.loopexit ]
  %45 = icmp eq i32 %xtraiter98, 0
  br i1 %45, label %for.inc80.us.prol.loopexit, label %for.inc80.us.prol

for.inc80.us.prol:                                ; preds = %for.inc80.us.preheader
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv123
  %46 = load double, double* %arrayidx66.us.prol, align 8
  %sunkaddr142 = ptrtoint [1200 x double]* %Q to i64
  %sunkaddr143 = mul i64 %indvars.iv128, 8
  %sunkaddr144 = add i64 %sunkaddr142, %sunkaddr143
  %sunkaddr145 = inttoptr i64 %sunkaddr144 to double*
  %47 = load double, double* %sunkaddr145, align 8
  %mul75.us.prol = fmul double %47, %44
  %sub.us.prol = fsub double %46, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.inc80.us.prol.loopexit

for.inc80.us.prol.loopexit:                       ; preds = %for.inc80.us.preheader, %for.inc80.us.prol
  %indvars.iv114.unr.ph = phi i64 [ 1, %for.inc80.us.prol ], [ 0, %for.inc80.us.preheader ]
  %48 = icmp eq i32 %0, 0
  br i1 %48, label %for.cond33.loopexit.us, label %for.inc80.us.preheader137

for.inc80.us.preheader137:                        ; preds = %for.inc80.us.prol.loopexit
  br label %for.inc80.us

for.inc29:                                        ; preds = %for.inc29.preheader138, %for.inc29
  %indvars.iv95 = phi i64 [ %indvars.iv.next96.1, %for.inc29 ], [ %indvars.iv95.unr.ph, %for.inc29.preheader138 ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv128
  %49 = load double, double* %arrayidx20, align 8
  %50 = load double, double* %arrayidx13, align 8
  %div = fdiv double %49, %50
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv95, i64 %indvars.iv128
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next96, i64 %indvars.iv128
  %51 = load double, double* %arrayidx20.1, align 8
  %52 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %51, %52
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next96, i64 %indvars.iv128
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next96.1 = add nuw nsw i64 %indvars.iv95, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next96.1, %wide.trip.count.3
  br i1 %exitcond.1, label %for.cond33.preheader.loopexit, label %for.inc29

for.inc86.loopexit94:                             ; preds = %for.body35.lr.ph
  %53 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %53, i8 0, i64 %15, i32 8, i1 false)
  br label %for.inc86

for.inc86.loopexit:                               ; preds = %for.cond33.loopexit.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit, %for.cond33.preheader, %for.inc86.loopexit94
  %exitcond = icmp eq i64 %indvars.iv.next129, %8
  br i1 %exitcond, label %for.end88.loopexit, label %for.inc86.for.cond1.preheader_crit_edge

for.inc86.for.cond1.preheader_crit_edge:          ; preds = %for.inc86
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  br label %for.cond1.preheader

for.end88.loopexit:                               ; preds = %for.inc86
  br label %for.end88

for.end88:                                        ; preds = %for.end88.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %R, [1200 x double]* nocapture readonly %Q) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp27 = icmp sgt i32 %n, 0
  br i1 %cmp27, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next15, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv14, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv9 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next10, %for.inc.us ]
  %6 = add nsw i64 %indvars.iv9, %5
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv14, i64 %indvars.iv9
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next10, %4
  br i1 %exitcond20, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next15, %4
  br i1 %exitcond21, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = icmp sgt i32 %n, 0
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %cmp1623 = icmp sgt i32 %m, 0
  %or.cond = and i1 %cmp1623, %11
  br i1 %or.cond, label %for.cond18.preheader.us.preheader, label %for.end38

for.cond18.preheader.us.preheader:                ; preds = %for.end12
  %14 = sext i32 %n to i64
  %15 = zext i32 %n to i64
  %16 = zext i32 %m to i64
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.for.inc36_crit_edge.us, %for.cond18.preheader.us.preheader
  %indvars.iv3 = phi i64 [ 0, %for.cond18.preheader.us.preheader ], [ %indvars.iv.next4, %for.cond18.for.inc36_crit_edge.us ]
  %17 = mul nsw i64 %indvars.iv3, %14
  br label %for.body20.us

for.body20.us:                                    ; preds = %for.inc33.us, %for.cond18.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next, %for.inc33.us ]
  %18 = add nsw i64 %indvars.iv, %17
  %19 = trunc i64 %18 to i32
  %rem23.us = srem i32 %19, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %for.inc33.us

if.then25.us:                                     ; preds = %for.body20.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.body20.us, %if.then25.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv3, i64 %indvars.iv
  %22 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, %15
  br i1 %exitcond19, label %for.cond18.for.inc36_crit_edge.us, label %for.body20.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %for.inc33.us
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, %16
  br i1 %exitcond, label %for.end38.loopexit, label %for.cond18.preheader.us

for.end38.loopexit:                               ; preds = %for.cond18.for.inc36_crit_edge.us
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.end12
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
