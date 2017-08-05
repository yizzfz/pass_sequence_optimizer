; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #2 {
entry:
  %cmp7 = icmp sgt i32 %m, 0
  br i1 %cmp7, label %for.cond1.preheader.lr.ph, label %for.cond15.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp25 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  br i1 %cmp25, label %for.cond1.preheader.us.preheader, label %for.end32

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count15 = zext i32 %n to i64
  %wide.trip.count20 = zext i32 %m to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc12_crit_edge.us
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %for.cond1.for.inc12_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv12 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next13, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv12, %indvars.iv18
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv12
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv18, i64 %indvars.iv12
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, %wide.trip.count15
  br i1 %exitcond, label %for.cond1.for.inc12_crit_edge.us, label %for.body3.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond21, label %for.cond15.preheader.loopexit, label %for.cond1.preheader.us

for.cond15.preheader.loopexit:                    ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  %cmp163 = icmp sgt i32 %n, 0
  br i1 %cmp163, label %for.cond19.preheader.us.preheader, label %for.end32

for.cond19.preheader.us.preheader:                ; preds = %for.cond15.preheader
  %2 = add i32 %n, -1
  %3 = zext i32 %2 to i64
  %4 = shl nuw nsw i64 %3, 3
  %5 = add nuw nsw i64 %4, 8
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond19.preheader.us.prol.loopexit, label %for.cond19.for.inc30_crit_edge.us.prol.preheader

for.cond19.for.inc30_crit_edge.us.prol.preheader: ; preds = %for.cond19.preheader.us.preheader
  br label %for.cond19.for.inc30_crit_edge.us.prol

for.cond19.for.inc30_crit_edge.us.prol:           ; preds = %for.cond19.for.inc30_crit_edge.us.prol.preheader, %for.cond19.for.inc30_crit_edge.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.cond19.for.inc30_crit_edge.us.prol ], [ 0, %for.cond19.for.inc30_crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond19.for.inc30_crit_edge.us.prol ], [ %xtraiter, %for.cond19.for.inc30_crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.prol, i64 0
  %scevgep11.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond19.preheader.us.prol.loopexit.loopexit, label %for.cond19.for.inc30_crit_edge.us.prol, !llvm.loop !1

for.cond19.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond19.for.inc30_crit_edge.us.prol
  br label %for.cond19.preheader.us.prol.loopexit

for.cond19.preheader.us.prol.loopexit:            ; preds = %for.cond19.preheader.us.prol.loopexit.loopexit, %for.cond19.preheader.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.cond19.preheader.us.preheader ], [ %indvars.iv.next.prol, %for.cond19.preheader.us.prol.loopexit.loopexit ]
  %6 = icmp ult i32 %2, 3
  br i1 %6, label %for.end32, label %for.cond19.for.inc30_crit_edge.us.3.preheader

for.cond19.for.inc30_crit_edge.us.3.preheader:    ; preds = %for.cond19.preheader.us.prol.loopexit
  %wide.trip.count.3 = zext i32 %n to i64
  %7 = add nsw i64 %wide.trip.count.3, -4
  %8 = sub i64 %7, %indvars.iv.unr
  %9 = lshr i64 %8, 2
  %10 = and i64 %9, 1
  %lcmp.mod25 = icmp eq i64 %10, 0
  br i1 %lcmp.mod25, label %for.cond19.for.inc30_crit_edge.us.3.prol.preheader, label %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit

for.cond19.for.inc30_crit_edge.us.3.prol.preheader: ; preds = %for.cond19.for.inc30_crit_edge.us.3.preheader
  br label %for.cond19.for.inc30_crit_edge.us.3.prol

for.cond19.for.inc30_crit_edge.us.3.prol:         ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.preheader
  %scevgep.prol27 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.unr, i64 0
  %scevgep11.prol28 = bitcast double* %scevgep.prol27 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.prol28, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.prol29 = add nuw nsw i64 %indvars.iv.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.prol29, i64 0
  %scevgep11.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.1.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1.prol, i64 0
  %scevgep11.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.2.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.2.prol = add nsw i64 %indvars.iv.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2.prol, i64 0
  %scevgep11.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.3.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit

for.cond19.for.inc30_crit_edge.us.3.prol.loopexit: ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol, %for.cond19.for.inc30_crit_edge.us.3.preheader
  %indvars.iv.unr30 = phi i64 [ %indvars.iv.unr, %for.cond19.for.inc30_crit_edge.us.3.preheader ], [ %indvars.iv.next.3.prol, %for.cond19.for.inc30_crit_edge.us.3.prol ]
  %11 = icmp eq i64 %9, 0
  br i1 %11, label %for.end32.loopexit, label %for.cond19.for.inc30_crit_edge.us.3.preheader.new

for.cond19.for.inc30_crit_edge.us.3.preheader.new: ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit
  br label %for.cond19.for.inc30_crit_edge.us.3

for.end32.loopexit.unr-lcssa:                     ; preds = %for.cond19.for.inc30_crit_edge.us.3
  br label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit, %for.end32.loopexit.unr-lcssa
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %for.cond1.preheader.lr.ph, %for.cond19.preheader.us.prol.loopexit, %for.cond15.preheader
  ret void

for.cond19.for.inc30_crit_edge.us.3:              ; preds = %for.cond19.for.inc30_crit_edge.us.3, %for.cond19.for.inc30_crit_edge.us.3.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr30, %for.cond19.for.inc30_crit_edge.us.3.preheader.new ], [ %indvars.iv.next.3.1, %for.cond19.for.inc30_crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 0
  %scevgep11 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next, i64 0
  %scevgep11.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1, i64 0
  %scevgep11.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.2, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2, i64 0
  %scevgep11.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.3, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %scevgep.131 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.3, i64 0
  %scevgep11.132 = bitcast double* %scevgep.131 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.132, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.133 = add nsw i64 %indvars.iv, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.133, i64 0
  %scevgep11.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.1.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1.1, i64 0
  %scevgep11.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.2.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.2.1 = add nsw i64 %indvars.iv, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2.1, i64 0
  %scevgep11.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.3.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %wide.trip.count.3
  br i1 %exitcond.3.1, label %for.end32.loopexit.unr-lcssa, label %for.cond19.for.inc30_crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  %cmp43 = icmp sgt i32 %n, 0
  br i1 %cmp43, label %for.cond1.preheader.lr.ph, label %for.end88

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp21 = icmp sgt i32 %m, 0
  %cmp154 = icmp sgt i32 %m, 0
  %cmp416 = icmp sgt i32 %m, 0
  %cmp618 = icmp sgt i32 %m, 0
  %0 = add i32 %m, -1
  %1 = add i32 %n, -2
  %2 = zext i32 %1 to i64
  %3 = sext i32 %n to i64
  %xtraiter = and i32 %m, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %4 = icmp ult i32 %0, 3
  %wide.trip.count.3 = zext i32 %m to i64
  %xtraiter49 = and i32 %m, 1
  %lcmp.mod50 = icmp eq i32 %xtraiter49, 0
  %5 = icmp eq i32 %0, 0
  %wide.trip.count48.1 = zext i32 %m to i64
  %xtraiter61 = and i32 %m, 1
  %lcmp.mod62 = icmp eq i32 %xtraiter61, 0
  %6 = icmp eq i32 %0, 0
  %xtraiter68 = and i32 %m, 1
  %lcmp.mod69 = icmp eq i32 %xtraiter68, 0
  %7 = icmp eq i32 %0, 0
  %wide.trip.count67.1 = zext i32 %m to i64
  %wide.trip.count76 = zext i32 %n to i64
  %wide.trip.count60.1 = zext i32 %m to i64
  %wide.trip.count81 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc86, %for.cond1.preheader.lr.ph
  %indvars.iv79 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next80, %for.inc86 ]
  %indvars.iv72 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next73, %for.inc86 ]
  %8 = mul nuw nsw i64 %indvars.iv79, 1201
  %9 = add nuw nsw i64 %8, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %9
  %scevgep57 = bitcast double* %scevgep to i8*
  %10 = sub i64 %2, %indvars.iv79
  %11 = shl i64 %10, 3
  %12 = and i64 %11, 34359738360
  %13 = add nuw nsw i64 %12, 8
  br i1 %cmp21, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %for.cond1.preheader
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %nrm.03.prol = phi double [ %add.prol, %for.inc.prol ], [ 0.000000e+00, %for.inc.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.prol ], [ %xtraiter, %for.inc.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.prol, i64 %indvars.iv79
  %14 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %14, %14
  %add.prol = fadd double %nrm.03.prol, %mul.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !3

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next.prol, %for.inc.prol.loopexit.loopexit ]
  %nrm.03.unr = phi double [ 0.000000e+00, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  br i1 %4, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc ], [ %indvars.iv.unr, %for.inc.preheader ]
  %nrm.03 = phi double [ %add.3, %for.inc ], [ %nrm.03.unr, %for.inc.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv79
  %15 = load double, double* %arrayidx5, align 8
  %mul = fmul double %15, %15
  %add = fadd double %nrm.03, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv79
  %16 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %16, %16
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv79
  %17 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %17, %17
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv79
  %18 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %18, %18
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit, %for.cond1.preheader
  %nrm.0.lcssa = phi double [ 0.000000e+00, %for.cond1.preheader ], [ %add.lcssa.unr, %for.inc.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %nrm.0.lcssa) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv79, i64 %indvars.iv79
  store double %call, double* %arrayidx13, align 8
  br i1 %cmp154, label %for.body16.preheader, label %for.cond33.preheader

for.body16.preheader:                             ; preds = %for.end
  br i1 %lcmp.mod50, label %for.body16.prol.loopexit, label %for.body16.prol

for.body16.prol:                                  ; preds = %for.body16.preheader
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv79
  %19 = load double, double* %arrayidx20.prol, align 8
  %20 = load double, double* %arrayidx13, align 8
  %div.prol = fdiv double %19, %20
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv79
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.body16.prol.loopexit

for.body16.prol.loopexit:                         ; preds = %for.body16.prol, %for.body16.preheader
  %indvars.iv46.unr.ph = phi i64 [ 1, %for.body16.prol ], [ 0, %for.body16.preheader ]
  br i1 %5, label %for.cond33.preheader, label %for.body16.preheader88

for.body16.preheader88:                           ; preds = %for.body16.prol.loopexit
  br label %for.body16

for.cond33.preheader.loopexit:                    ; preds = %for.body16
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.cond33.preheader.loopexit, %for.body16.prol.loopexit, %for.end
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %cmp3411 = icmp slt i64 %indvars.iv.next80, %3
  br i1 %cmp3411, label %for.body35.lr.ph, label %for.inc86

for.body35.lr.ph:                                 ; preds = %for.cond33.preheader
  br i1 %cmp416, label %for.body35.us.preheader, label %for.inc86.loopexit45

for.body35.us.preheader:                          ; preds = %for.body35.lr.ph
  %arrayidx70.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv79
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv79
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.body35.us.preheader, %for.cond33.loopexit.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %for.cond33.loopexit.us ], [ %indvars.iv72, %for.body35.us.preheader ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv79, i64 %indvars.iv74
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 %lcmp.mod62, label %for.body42.us.prol.loopexit, label %for.body42.us.prol

for.body42.us.prol:                               ; preds = %for.body35.us
  %21 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv74
  %22 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %21, %22
  %23 = load double, double* %arrayidx39.us, align 8
  %add56.us.prol = fadd double %23, %mul51.us.prol
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.body42.us.prol.loopexit

for.body42.us.prol.loopexit:                      ; preds = %for.body42.us.prol, %for.body35.us
  %indvars.iv58.unr.ph = phi i64 [ 1, %for.body42.us.prol ], [ 0, %for.body35.us ]
  br i1 %6, label %for.cond40.for.cond60.preheader_crit_edge.us, label %for.body42.us.preheader

for.body42.us.preheader:                          ; preds = %for.body42.us.prol.loopexit
  br label %for.body42.us

for.body62.us:                                    ; preds = %for.body62.us.preheader87, %for.body62.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66.1, %for.body62.us ], [ %indvars.iv65.unr.ph, %for.body62.us.preheader87 ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv74
  %24 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv65, i64 %indvars.iv79
  %25 = load double, double* %arrayidx70.us, align 8
  %26 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %25, %26
  %sub.us = fsub double %24, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next66, i64 %indvars.iv74
  %27 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next66, i64 %indvars.iv79
  %28 = load double, double* %arrayidx70.us.1, align 8
  %29 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %28, %29
  %sub.us.1 = fsub double %27, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next66.1 = add nsw i64 %indvars.iv65, 2
  %exitcond.171 = icmp eq i64 %indvars.iv.next66.1, %wide.trip.count67.1
  br i1 %exitcond.171, label %for.cond33.loopexit.us.loopexit, label %for.body62.us

for.body42.us:                                    ; preds = %for.body42.us.preheader, %for.body42.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.1, %for.body42.us ], [ %indvars.iv58.unr.ph, %for.body42.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv58, i64 %indvars.iv79
  %30 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv74
  %31 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %30, %31
  %32 = load double, double* %arrayidx39.us, align 8
  %add56.us = fadd double %32, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next59, i64 %indvars.iv79
  %33 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next59, i64 %indvars.iv74
  %34 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %33, %34
  %35 = load double, double* %arrayidx39.us, align 8
  %add56.us.1 = fadd double %35, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %exitcond.164 = icmp eq i64 %indvars.iv.next59.1, %wide.trip.count60.1
  br i1 %exitcond.164, label %for.cond40.for.cond60.preheader_crit_edge.us.loopexit, label %for.body42.us

for.cond33.loopexit.us.loopexit:                  ; preds = %for.body62.us
  br label %for.cond33.loopexit.us

for.cond33.loopexit.us:                           ; preds = %for.cond33.loopexit.us.loopexit, %for.body62.us.prol.loopexit, %for.cond40.for.cond60.preheader_crit_edge.us
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond = icmp eq i64 %indvars.iv.next75, %wide.trip.count76
  br i1 %exitcond, label %for.inc86.loopexit, label %for.body35.us

for.cond40.for.cond60.preheader_crit_edge.us.loopexit: ; preds = %for.body42.us
  br label %for.cond40.for.cond60.preheader_crit_edge.us

for.cond40.for.cond60.preheader_crit_edge.us:     ; preds = %for.cond40.for.cond60.preheader_crit_edge.us.loopexit, %for.body42.us.prol.loopexit
  br i1 %cmp618, label %for.body62.us.preheader, label %for.cond33.loopexit.us

for.body62.us.preheader:                          ; preds = %for.cond40.for.cond60.preheader_crit_edge.us
  br i1 %lcmp.mod69, label %for.body62.us.prol.loopexit, label %for.body62.us.prol

for.body62.us.prol:                               ; preds = %for.body62.us.preheader
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv74
  %36 = load double, double* %arrayidx66.us.prol, align 8
  %37 = load double, double* %arrayidx70.us.prol, align 8
  %38 = load double, double* %arrayidx39.us, align 8
  %mul75.us.prol = fmul double %37, %38
  %sub.us.prol = fsub double %36, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.body62.us.prol.loopexit

for.body62.us.prol.loopexit:                      ; preds = %for.body62.us.prol, %for.body62.us.preheader
  %indvars.iv65.unr.ph = phi i64 [ 1, %for.body62.us.prol ], [ 0, %for.body62.us.preheader ]
  br i1 %7, label %for.cond33.loopexit.us, label %for.body62.us.preheader87

for.body62.us.preheader87:                        ; preds = %for.body62.us.prol.loopexit
  br label %for.body62.us

for.body16:                                       ; preds = %for.body16.preheader88, %for.body16
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.1, %for.body16 ], [ %indvars.iv46.unr.ph, %for.body16.preheader88 ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv79
  %39 = load double, double* %arrayidx20, align 8
  %40 = load double, double* %arrayidx13, align 8
  %div = fdiv double %39, %40
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv46, i64 %indvars.iv79
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next47, i64 %indvars.iv79
  %41 = load double, double* %arrayidx20.1, align 8
  %42 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %41, %42
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next47, i64 %indvars.iv79
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next47.1, %wide.trip.count48.1
  br i1 %exitcond.1, label %for.cond33.preheader.loopexit, label %for.body16

for.inc86.loopexit45:                             ; preds = %for.body35.lr.ph
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep57, i8 0, i64 %13, i32 8, i1 false)
  br label %for.inc86

for.inc86.loopexit:                               ; preds = %for.cond33.loopexit.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit, %for.inc86.loopexit45, %for.cond33.preheader
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next80, %wide.trip.count81
  br i1 %exitcond82, label %for.end88.loopexit, label %for.cond1.preheader

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count23 = zext i32 %n to i64
  %wide.trip.count28 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv25 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next26, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv25, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv20 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next21, %if.end.us ]
  %5 = add nsw i64 %indvars.iv20, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #6
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv25, i64 %indvars.iv20
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next21, %wide.trip.count23
  br i1 %exitcond24, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next26, %wide.trip.count28
  br i1 %exitcond29, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %cmp166 = icmp sgt i32 %m, 0
  %cmp194 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp166, %cmp194
  br i1 %or.cond, label %for.cond18.preheader.us.preheader, label %for.end38

for.cond18.preheader.us.preheader:                ; preds = %for.end12
  %12 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count17 = zext i32 %m to i64
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.for.inc36_crit_edge.us, %for.cond18.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %for.cond18.preheader.us.preheader ], [ %indvars.iv.next15, %for.cond18.for.inc36_crit_edge.us ]
  %13 = mul nsw i64 %indvars.iv14, %12
  br label %for.body20.us

for.body20.us:                                    ; preds = %if.end27.us, %for.cond18.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next, %if.end27.us ]
  %14 = add nsw i64 %indvars.iv, %13
  %15 = trunc i64 %14 to i32
  %rem23.us = srem i32 %15, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %if.end27.us

if.then25.us:                                     ; preds = %for.body20.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %if.end27.us

if.end27.us:                                      ; preds = %if.then25.us, %for.body20.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv14, i64 %indvars.iv
  %18 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond18.for.inc36_crit_edge.us, label %for.body20.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %if.end27.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, %wide.trip.count17
  br i1 %exitcond18, label %for.end38.loopexit, label %for.cond18.preheader.us

for.end38.loopexit:                               ; preds = %for.cond18.for.inc36_crit_edge.us
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
