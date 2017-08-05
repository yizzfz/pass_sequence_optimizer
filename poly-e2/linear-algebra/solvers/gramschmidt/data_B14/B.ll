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
  %1 = bitcast i8* %call2 to [1200 x double]*
  %2 = bitcast i8* %call1 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %2, [1200 x double]* %1)
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
  %cmp7 = icmp sgt i32 %m, 0
  br i1 %cmp7, label %for.cond1.preheader.lr.ph, label %for.cond15.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp25 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  br i1 %cmp25, label %for.cond1.preheader.us.preheader, label %for.end32

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %n, -1
  %1 = sext i32 %m to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc12_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv17 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next18, %for.cond1.for.inc12_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %2 = mul nsw i64 %indvars.iv12, %indvars.iv17
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv12
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv17, i64 %indvars.iv12
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %exitcond = icmp eq i64 %indvars.iv12, %wide.trip.count
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  br i1 %exitcond, label %for.cond1.for.inc12_crit_edge.us, label %for.body3.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next18 = add nuw i64 %indvars.iv17, 1
  %cmp.us = icmp slt i64 %indvars.iv.next18, %1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond15.preheader.loopexit

for.cond15.preheader.loopexit:                    ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  %cmp163 = icmp sgt i32 %n, 0
  br i1 %cmp163, label %for.cond19.preheader.us.preheader, label %for.end32

for.cond19.preheader.us.preheader:                ; preds = %for.cond15.preheader
  %4 = add i32 %n, -1
  %5 = zext i32 %4 to i64
  %6 = shl nuw nsw i64 %5, 3
  %7 = add nuw nsw i64 %6, 8
  %8 = sext i32 %n to i64
  %9 = add nsw i64 %8, -1
  %xtraiter = and i64 %8, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond19.for.inc30_crit_edge.us.prol.loopexit, label %for.cond19.for.inc30_crit_edge.us.prol.preheader

for.cond19.for.inc30_crit_edge.us.prol.preheader: ; preds = %for.cond19.preheader.us.preheader
  br label %for.cond19.for.inc30_crit_edge.us.prol

for.cond19.for.inc30_crit_edge.us.prol:           ; preds = %for.cond19.for.inc30_crit_edge.us.prol, %for.cond19.for.inc30_crit_edge.us.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %for.cond19.for.inc30_crit_edge.us.prol.preheader ], [ %indvars.iv.next.prol, %for.cond19.for.inc30_crit_edge.us.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.cond19.for.inc30_crit_edge.us.prol.preheader ], [ %prol.iter.sub, %for.cond19.for.inc30_crit_edge.us.prol ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.prol, i64 0
  %scevgep11.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.prol, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.prol = add nuw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond19.for.inc30_crit_edge.us.prol.loopexit.loopexit, label %for.cond19.for.inc30_crit_edge.us.prol, !llvm.loop !1

for.cond19.for.inc30_crit_edge.us.prol.loopexit.loopexit: ; preds = %for.cond19.for.inc30_crit_edge.us.prol
  br label %for.cond19.for.inc30_crit_edge.us.prol.loopexit

for.cond19.for.inc30_crit_edge.us.prol.loopexit:  ; preds = %for.cond19.for.inc30_crit_edge.us.prol.loopexit.loopexit, %for.cond19.preheader.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.cond19.preheader.us.preheader ], [ %indvars.iv.next.prol, %for.cond19.for.inc30_crit_edge.us.prol.loopexit.loopexit ]
  %10 = icmp ult i64 %9, 7
  br i1 %10, label %for.end32, label %for.cond19.preheader.us.preheader.new

for.cond19.preheader.us.preheader.new:            ; preds = %for.cond19.for.inc30_crit_edge.us.prol.loopexit
  br label %for.cond19.for.inc30_crit_edge.us

for.cond19.for.inc30_crit_edge.us:                ; preds = %for.cond19.for.inc30_crit_edge.us, %for.cond19.preheader.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.cond19.preheader.us.preheader.new ], [ %indvars.iv.next.7, %for.cond19.for.inc30_crit_edge.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 0
  %scevgep11 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next, i64 0
  %scevgep11.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.1 = add i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1, i64 0
  %scevgep11.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.2, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.2 = add i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2, i64 0
  %scevgep11.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.3, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.3 = add i64 %indvars.iv, 4
  %scevgep.4 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.3, i64 0
  %scevgep11.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.4, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.4 = add i64 %indvars.iv, 5
  %scevgep.5 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.4, i64 0
  %scevgep11.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.5, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.5 = add i64 %indvars.iv, 6
  %scevgep.6 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.5, i64 0
  %scevgep11.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.6, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.6 = add i64 %indvars.iv, 7
  %scevgep.7 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.6, i64 0
  %scevgep11.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.7, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.7 = add i64 %indvars.iv, 8
  %cmp16.us.7 = icmp slt i64 %indvars.iv.next.7, %8
  br i1 %cmp16.us.7, label %for.cond19.for.inc30_crit_edge.us, label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.cond19.for.inc30_crit_edge.us
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %for.cond19.for.inc30_crit_edge.us.prol.loopexit, %for.cond1.preheader.lr.ph, %for.cond15.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  %cmp13 = icmp sgt i32 %n, 0
  br i1 %cmp13, label %for.cond1.preheader.lr.ph, label %for.end88

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = add i32 %m, -1
  %1 = add i32 %n, -2
  %2 = zext i32 %1 to i64
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %0 to i64
  %4 = add nuw nsw i64 %wide.trip.count, 1
  %5 = add nsw i64 %wide.trip.count, -1
  %6 = icmp sgt i32 %m, 0
  %xtraiter = and i64 %4, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %7 = icmp ult i32 %0, 3
  %8 = icmp sgt i32 %m, 0
  %exitcond4975 = icmp eq i32 %0, 0
  %xtraiter83 = and i64 %wide.trip.count, 1
  %lcmp.mod84 = icmp eq i64 %xtraiter83, 0
  %9 = icmp eq i64 %5, 0
  %10 = icmp sgt i32 %m, 0
  %xtraiter85 = and i64 %4, 1
  %lcmp.mod86 = icmp eq i64 %xtraiter85, 0
  %11 = icmp eq i32 %0, 0
  %exitcond6481 = icmp eq i32 %0, 0
  %xtraiter87 = and i64 %wide.trip.count, 1
  %lcmp.mod88 = icmp eq i64 %xtraiter87, 0
  %12 = icmp eq i64 %5, 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc86, %for.cond1.preheader.lr.ph
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %for.inc86 ], [ 0, %for.cond1.preheader.lr.ph ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.inc86 ], [ 1, %for.cond1.preheader.lr.ph ]
  %13 = mul i64 %indvars.iv69, 1201
  %14 = add i64 %13, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %14
  %15 = sub i64 %2, %indvars.iv69
  %16 = shl i64 %15, 3
  %17 = and i64 %16, 34359738360
  %18 = add nuw nsw i64 %17, 8
  br i1 %6, label %for.inc.preheader, label %for.end

for.inc.preheader:                                ; preds = %for.cond1.preheader
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol, %for.inc.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %nrm.03.prol = phi double [ %add.prol, %for.inc.prol ], [ 0.000000e+00, %for.inc.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc.prol ], [ %xtraiter, %for.inc.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.prol, i64 %indvars.iv69
  %19 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %19, %19
  %add.prol = fadd double %nrm.03.prol, %mul.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !3

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.preheader
  %add.lcssa.unr = phi double [ undef, %for.inc.preheader ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %for.inc.preheader ], [ %indvars.iv.next.prol, %for.inc.prol.loopexit.loopexit ]
  %nrm.03.unr = phi double [ 0.000000e+00, %for.inc.preheader ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  br i1 %7, label %for.end, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc.preheader.new ], [ %indvars.iv.next.3, %for.inc ]
  %nrm.03 = phi double [ %nrm.03.unr, %for.inc.preheader.new ], [ %add.3, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv69
  %20 = load double, double* %arrayidx5, align 8
  %mul = fmul double %20, %20
  %add = fadd double %nrm.03, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv69
  %21 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %21, %21
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv69
  %22 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %22, %22
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv69
  %23 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %23, %23
  %add.3 = fadd double %add.2, %mul.3
  %exitcond.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond.3, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit, %for.cond1.preheader
  %nrm.0.lcssa = phi double [ 0.000000e+00, %for.cond1.preheader ], [ %add.lcssa.unr, %for.inc.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %nrm.0.lcssa) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv69, i64 %indvars.iv69
  store double %call, double* %arrayidx13, align 8
  br i1 %8, label %for.body16.preheader, label %for.cond33.preheader

for.body16.preheader:                             ; preds = %for.end
  %arrayidx2072 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv69
  %24 = load double, double* %arrayidx2072, align 8
  %div73 = fdiv double %24, %call
  %arrayidx2874 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv69
  store double %div73, double* %arrayidx2874, align 8
  br i1 %exitcond4975, label %for.cond33.preheader, label %for.body16.for.body16_crit_edge.preheader

for.body16.for.body16_crit_edge.preheader:        ; preds = %for.body16.preheader
  br i1 %lcmp.mod84, label %for.body16.for.body16_crit_edge.prol.loopexit, label %for.body16.for.body16_crit_edge.prol

for.body16.for.body16_crit_edge.prol:             ; preds = %for.body16.for.body16_crit_edge.preheader
  %.pre.prol = load double, double* %arrayidx13, align 8
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 1, i64 %indvars.iv69
  %25 = load double, double* %arrayidx20.prol, align 8
  %div.prol = fdiv double %25, %.pre.prol
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 1, i64 %indvars.iv69
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.body16.for.body16_crit_edge.prol.loopexit

for.body16.for.body16_crit_edge.prol.loopexit:    ; preds = %for.body16.for.body16_crit_edge.prol, %for.body16.for.body16_crit_edge.preheader
  %indvars.iv4676.unr.ph = phi i64 [ 1, %for.body16.for.body16_crit_edge.prol ], [ 0, %for.body16.for.body16_crit_edge.preheader ]
  br i1 %9, label %for.cond33.preheader, label %for.body16.for.body16_crit_edge.preheader.new

for.body16.for.body16_crit_edge.preheader.new:    ; preds = %for.body16.for.body16_crit_edge.prol.loopexit
  br label %for.body16.for.body16_crit_edge

for.cond33.preheader.loopexit:                    ; preds = %for.body16.for.body16_crit_edge
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.cond33.preheader.loopexit, %for.body16.for.body16_crit_edge.prol.loopexit, %for.body16.preheader, %for.end
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %cmp3411 = icmp slt i64 %indvars.iv.next70, %3
  br i1 %cmp3411, label %for.body35.lr.ph, label %for.inc86

for.body35.lr.ph:                                 ; preds = %for.cond33.preheader
  br i1 %10, label %for.body35.us.preheader, label %for.inc86.loopexit45

for.body35.us.preheader:                          ; preds = %for.body35.lr.ph
  %arrayidx70.us78 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv69
  %arrayidx70.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 1, i64 %indvars.iv69
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv69
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.body35.us.preheader, %for.cond33.loopexit.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %for.cond33.loopexit.us ], [ %indvars.iv65, %for.body35.us.preheader ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv69, i64 %indvars.iv67
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 %lcmp.mod86, label %for.body42.us.prol.loopexit, label %for.body42.us.prol

for.body42.us.prol:                               ; preds = %for.body35.us
  %26 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv67
  %27 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %26, %27
  %add56.us.prol = fadd double %mul51.us.prol, 0.000000e+00
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.body42.us.prol.loopexit

for.body42.us.prol.loopexit:                      ; preds = %for.body42.us.prol, %for.body35.us
  %add56.us.lcssa.unr.ph = phi double [ %add56.us.prol, %for.body42.us.prol ], [ undef, %for.body35.us ]
  %.unr.ph = phi double [ %add56.us.prol, %for.body42.us.prol ], [ 0.000000e+00, %for.body35.us ]
  %indvars.iv57.unr.ph = phi i64 [ 1, %for.body42.us.prol ], [ 0, %for.body35.us ]
  br i1 %11, label %for.body62.us.preheader, label %for.body35.us.new

for.body35.us.new:                                ; preds = %for.body42.us.prol.loopexit
  br label %for.body42.us

for.body62.us.for.body62.us_crit_edge:            ; preds = %for.body62.us.for.body62.us_crit_edge, %for.body62.us.for.body62.us_crit_edge.preheader.new
  %indvars.iv6182 = phi i64 [ %indvars.iv6182.unr.ph, %for.body62.us.for.body62.us_crit_edge.preheader.new ], [ %indvars.iv.next62.1, %for.body62.us.for.body62.us_crit_edge ]
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv6182, 1
  %.pre71 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next62, i64 %indvars.iv67
  %28 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next62, i64 %indvars.iv69
  %29 = load double, double* %arrayidx70.us, align 8
  %mul75.us = fmul double %29, %.pre71
  %sub.us = fsub double %28, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv6182, 2
  %.pre71.1 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next62.1, i64 %indvars.iv67
  %30 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next62.1, i64 %indvars.iv69
  %31 = load double, double* %arrayidx70.us.1, align 8
  %mul75.us.1 = fmul double %31, %.pre71.1
  %sub.us.1 = fsub double %30, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %exitcond64.1 = icmp eq i64 %indvars.iv.next62.1, %wide.trip.count
  br i1 %exitcond64.1, label %for.cond33.loopexit.us.loopexit, label %for.body62.us.for.body62.us_crit_edge

for.body42.us:                                    ; preds = %for.body42.us, %for.body35.us.new
  %32 = phi double [ %.unr.ph, %for.body35.us.new ], [ %add56.us.1, %for.body42.us ]
  %indvars.iv57 = phi i64 [ %indvars.iv57.unr.ph, %for.body35.us.new ], [ %indvars.iv.next58.1, %for.body42.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv57, i64 %indvars.iv69
  %33 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv67
  %34 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %33, %34
  %add56.us = fadd double %32, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next58, i64 %indvars.iv69
  %35 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next58, i64 %indvars.iv67
  %36 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %35, %36
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %exitcond60.1 = icmp eq i64 %indvars.iv.next58, %wide.trip.count
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  br i1 %exitcond60.1, label %for.body62.us.preheader.loopexit, label %for.body42.us

for.cond33.loopexit.us.loopexit:                  ; preds = %for.body62.us.for.body62.us_crit_edge
  br label %for.cond33.loopexit.us

for.cond33.loopexit.us:                           ; preds = %for.cond33.loopexit.us.loopexit, %for.body62.us.for.body62.us_crit_edge.prol.loopexit, %for.body62.us.preheader
  %indvars.iv.next68 = add i64 %indvars.iv67, 1
  %cmp34.us = icmp slt i64 %indvars.iv.next68, %3
  br i1 %cmp34.us, label %for.body35.us, label %for.inc86.loopexit

for.body62.us.preheader.loopexit:                 ; preds = %for.body42.us
  br label %for.body62.us.preheader

for.body62.us.preheader:                          ; preds = %for.body62.us.preheader.loopexit, %for.body42.us.prol.loopexit
  %add56.us.lcssa = phi double [ %add56.us.lcssa.unr.ph, %for.body42.us.prol.loopexit ], [ %add56.us.1, %for.body62.us.preheader.loopexit ]
  %arrayidx66.us77 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv67
  %37 = load double, double* %arrayidx66.us77, align 8
  %38 = load double, double* %arrayidx70.us78, align 8
  %mul75.us79 = fmul double %38, %add56.us.lcssa
  %sub.us80 = fsub double %37, %mul75.us79
  store double %sub.us80, double* %arrayidx66.us77, align 8
  br i1 %exitcond6481, label %for.cond33.loopexit.us, label %for.body62.us.for.body62.us_crit_edge.preheader

for.body62.us.for.body62.us_crit_edge.preheader:  ; preds = %for.body62.us.preheader
  br i1 %lcmp.mod88, label %for.body62.us.for.body62.us_crit_edge.prol.loopexit, label %for.body62.us.for.body62.us_crit_edge.prol

for.body62.us.for.body62.us_crit_edge.prol:       ; preds = %for.body62.us.for.body62.us_crit_edge.preheader
  %.pre71.prol = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 1, i64 %indvars.iv67
  %39 = load double, double* %arrayidx66.us.prol, align 8
  %40 = load double, double* %arrayidx70.us.prol, align 8
  %mul75.us.prol = fmul double %40, %.pre71.prol
  %sub.us.prol = fsub double %39, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.body62.us.for.body62.us_crit_edge.prol.loopexit

for.body62.us.for.body62.us_crit_edge.prol.loopexit: ; preds = %for.body62.us.for.body62.us_crit_edge.prol, %for.body62.us.for.body62.us_crit_edge.preheader
  %indvars.iv6182.unr.ph = phi i64 [ 1, %for.body62.us.for.body62.us_crit_edge.prol ], [ 0, %for.body62.us.for.body62.us_crit_edge.preheader ]
  br i1 %12, label %for.cond33.loopexit.us, label %for.body62.us.for.body62.us_crit_edge.preheader.new

for.body62.us.for.body62.us_crit_edge.preheader.new: ; preds = %for.body62.us.for.body62.us_crit_edge.prol.loopexit
  br label %for.body62.us.for.body62.us_crit_edge

for.body16.for.body16_crit_edge:                  ; preds = %for.body16.for.body16_crit_edge, %for.body16.for.body16_crit_edge.preheader.new
  %indvars.iv4676 = phi i64 [ %indvars.iv4676.unr.ph, %for.body16.for.body16_crit_edge.preheader.new ], [ %indvars.iv.next47.1, %for.body16.for.body16_crit_edge ]
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv4676, 1
  %.pre = load double, double* %arrayidx13, align 8
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next47, i64 %indvars.iv69
  %41 = load double, double* %arrayidx20, align 8
  %div = fdiv double %41, %.pre
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next47, i64 %indvars.iv69
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv4676, 2
  %.pre.1 = load double, double* %arrayidx13, align 8
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next47.1, i64 %indvars.iv69
  %42 = load double, double* %arrayidx20.1, align 8
  %div.1 = fdiv double %42, %.pre.1
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next47.1, i64 %indvars.iv69
  store double %div.1, double* %arrayidx28.1, align 8
  %exitcond49.1 = icmp eq i64 %indvars.iv.next47.1, %wide.trip.count
  br i1 %exitcond49.1, label %for.cond33.preheader.loopexit, label %for.body16.for.body16_crit_edge

for.inc86.loopexit45:                             ; preds = %for.body35.lr.ph
  %43 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %43, i8 0, i64 %18, i32 8, i1 false)
  br label %for.inc86

for.inc86.loopexit:                               ; preds = %for.cond33.loopexit.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit, %for.cond33.preheader, %for.inc86.loopexit45
  %44 = icmp slt i64 %indvars.iv.next70, %3
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  br i1 %44, label %for.cond1.preheader, label %for.end88.loopexit

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
  %cmp7 = icmp sgt i32 %n, 0
  br i1 %cmp7, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv17 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next18, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv17, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv14 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next15, %if.end.us ]
  %5 = add nsw i64 %indvars.iv14, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv17, i64 %indvars.iv14
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next15 = add nuw i64 %indvars.iv14, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next15, %3
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next18 = add nuw i64 %indvars.iv17, 1
  %cmp.us = icmp slt i64 %indvars.iv.next18, %3
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = icmp sgt i32 %n, 0
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %cmp163 = icmp sgt i32 %m, 0
  %or.cond = and i1 %cmp163, %10
  br i1 %or.cond, label %for.cond18.preheader.us.preheader, label %for.end38

for.cond18.preheader.us.preheader:                ; preds = %for.end12
  %13 = sext i32 %n to i64
  %14 = sext i32 %m to i64
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.for.inc36_crit_edge.us, %for.cond18.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %for.cond18.preheader.us.preheader ], [ %indvars.iv.next12, %for.cond18.for.inc36_crit_edge.us ]
  %15 = mul nsw i64 %indvars.iv11, %13
  br label %for.body20.us

for.body20.us:                                    ; preds = %if.end27.us, %for.cond18.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next, %if.end27.us ]
  %16 = add nsw i64 %indvars.iv, %15
  %17 = trunc i64 %16 to i32
  %rem23.us = srem i32 %17, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %if.end27.us

if.then25.us:                                     ; preds = %for.body20.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %if.end27.us

if.end27.us:                                      ; preds = %for.body20.us, %if.then25.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv11, i64 %indvars.iv
  %20 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp19.us = icmp slt i64 %indvars.iv.next, %13
  br i1 %cmp19.us, label %for.body20.us, label %for.cond18.for.inc36_crit_edge.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %if.end27.us
  %indvars.iv.next12 = add nuw i64 %indvars.iv11, 1
  %cmp16.us = icmp slt i64 %indvars.iv.next12, %14
  br i1 %cmp16.us, label %for.cond18.preheader.us, label %for.end38.loopexit

for.end38.loopexit:                               ; preds = %for.cond18.for.inc36_crit_edge.us
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.end12
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
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
