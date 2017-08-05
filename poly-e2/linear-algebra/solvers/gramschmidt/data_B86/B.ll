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
  %arraydecay1 = bitcast i8* %call to [1200 x double]*
  %arraydecay32 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay43 = bitcast i8* %call2 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %arraydecay1, [1200 x double]* %arraydecay32, [1200 x double]* %arraydecay43)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %arraydecay1, [1200 x double]* %arraydecay32, [1200 x double]* %arraydecay43)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %2, [1200 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  %cmp7 = icmp sgt i32 %m, 0
  br i1 %cmp7, label %for.cond1.preheader.lr.ph, label %for.cond15.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp25 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  %wide.trip.count17 = zext i32 %n to i64
  %wide.trip.count21 = zext i32 %m to i64
  br i1 %cmp25, label %for.inc.lr.ph.us.preheader, label %for.end32

for.inc.lr.ph.us.preheader:                       ; preds = %for.cond1.preheader.lr.ph
  br label %for.inc.lr.ph.us

for.inc.lr.ph.us:                                 ; preds = %for.inc.lr.ph.us.preheader, %for.inc12.us
  %indvars.iv19.us = phi i64 [ %indvars.iv.next20.us, %for.inc12.us ], [ 0, %for.inc.lr.ph.us.preheader ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.lr.ph.us
  %indvars.iv14.us = phi i64 [ 0, %for.inc.lr.ph.us ], [ %indvars.iv.next15.us, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv14.us, %indvars.iv19.us
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv19.us, i64 %indvars.iv14.us
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv19.us, i64 %indvars.iv14.us
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv14.us, 1
  %exitcond18.us = icmp eq i64 %indvars.iv.next15.us, %wide.trip.count17
  br i1 %exitcond18.us, label %for.inc12.us, label %for.inc.us

for.inc12.us:                                     ; preds = %for.inc.us
  %indvars.iv.next20.us = add nuw nsw i64 %indvars.iv19.us, 1
  %exitcond22.us = icmp eq i64 %indvars.iv.next20.us, %wide.trip.count21
  br i1 %exitcond22.us, label %for.cond15.preheader.loopexit, label %for.inc.lr.ph.us

for.cond15.preheader.loopexit:                    ; preds = %for.inc12.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  %cmp163 = icmp sgt i32 %n, 0
  br i1 %cmp163, label %for.cond19.preheader.lr.ph, label %for.end32

for.cond19.preheader.lr.ph:                       ; preds = %for.cond15.preheader
  %wide.trip.count = zext i32 %n to i64
  %2 = shl nuw nsw i64 %wide.trip.count, 3
  %3 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc27.lr.ph.us.prol.loopexit, label %for.inc27.lr.ph.us.prol.preheader

for.inc27.lr.ph.us.prol.preheader:                ; preds = %for.cond19.preheader.lr.ph
  br label %for.inc27.lr.ph.us.prol

for.inc27.lr.ph.us.prol:                          ; preds = %for.inc27.lr.ph.us.prol.preheader, %for.inc27.lr.ph.us.prol.for.inc27.lr.ph.us.prol_crit_edge
  %indvars.iv10.us.prol = phi i64 [ %indvars.iv.next11.us.prol, %for.inc27.lr.ph.us.prol.for.inc27.lr.ph.us.prol_crit_edge ], [ 0, %for.inc27.lr.ph.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc27.lr.ph.us.prol.for.inc27.lr.ph.us.prol_crit_edge ], [ %xtraiter, %for.inc27.lr.ph.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv10.us.prol, i64 0
  %scevgep24.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.prol, i8 0, i64 %2, i32 8, i1 false)
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc27.lr.ph.us.prol.loopexit.loopexit, label %for.inc27.lr.ph.us.prol.for.inc27.lr.ph.us.prol_crit_edge, !llvm.loop !1

for.inc27.lr.ph.us.prol.for.inc27.lr.ph.us.prol_crit_edge: ; preds = %for.inc27.lr.ph.us.prol
  %indvars.iv.next11.us.prol = add nuw nsw i64 %indvars.iv10.us.prol, 1
  br label %for.inc27.lr.ph.us.prol

for.inc27.lr.ph.us.prol.loopexit.loopexit:        ; preds = %for.inc27.lr.ph.us.prol
  br label %for.inc27.lr.ph.us.prol.loopexit

for.inc27.lr.ph.us.prol.loopexit:                 ; preds = %for.inc27.lr.ph.us.prol.loopexit.loopexit, %for.cond19.preheader.lr.ph
  %indvars.iv10.us.unr = phi i64 [ 0, %for.cond19.preheader.lr.ph ], [ %xtraiter, %for.inc27.lr.ph.us.prol.loopexit.loopexit ]
  %4 = icmp ult i64 %3, 3
  br i1 %4, label %for.end32, label %for.inc27.lr.ph.us.preheader

for.inc27.lr.ph.us.preheader:                     ; preds = %for.inc27.lr.ph.us.prol.loopexit
  %5 = add nsw i64 %wide.trip.count, -4
  %6 = sub nsw i64 %5, %indvars.iv10.us.unr
  %7 = lshr i64 %6, 2
  %8 = and i64 %7, 1
  %lcmp.mod31 = icmp eq i64 %8, 0
  br i1 %lcmp.mod31, label %for.inc27.lr.ph.us.prol32, label %for.inc27.lr.ph.us.prol.loopexit29

for.inc27.lr.ph.us.prol32:                        ; preds = %for.inc27.lr.ph.us.preheader
  %scevgep.prol34 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv10.us.unr, i64 0
  %scevgep24.prol35 = bitcast double* %scevgep.prol34 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.prol35, i8 0, i64 %2, i32 8, i1 false)
  %indvars.iv.next11.us.prol36 = add nuw nsw i64 %indvars.iv10.us.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next11.us.prol36, i64 0
  %scevgep24.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.1.prol, i8 0, i64 %2, i32 8, i1 false)
  %indvars.iv.next11.us.1.prol = add nuw nsw i64 %indvars.iv10.us.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next11.us.1.prol, i64 0
  %scevgep24.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.2.prol, i8 0, i64 %2, i32 8, i1 false)
  %indvars.iv.next11.us.2.prol = add nuw nsw i64 %indvars.iv10.us.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next11.us.2.prol, i64 0
  %scevgep24.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.3.prol, i8 0, i64 %2, i32 8, i1 false)
  %indvars.iv.next11.us.3.prol = or i64 %indvars.iv10.us.unr, 4
  br label %for.inc27.lr.ph.us.prol.loopexit29

for.inc27.lr.ph.us.prol.loopexit29:               ; preds = %for.inc27.lr.ph.us.prol32, %for.inc27.lr.ph.us.preheader
  %indvars.iv10.us.unr37 = phi i64 [ %indvars.iv10.us.unr, %for.inc27.lr.ph.us.preheader ], [ %indvars.iv.next11.us.3.prol, %for.inc27.lr.ph.us.prol32 ]
  %9 = icmp eq i64 %7, 0
  br i1 %9, label %for.end32, label %for.inc27.lr.ph.us.preheader.new

for.inc27.lr.ph.us.preheader.new:                 ; preds = %for.inc27.lr.ph.us.prol.loopexit29
  br label %for.inc27.lr.ph.us

for.inc27.lr.ph.us:                               ; preds = %for.inc27.lr.ph.us, %for.inc27.lr.ph.us.preheader.new
  %indvars.iv10.us = phi i64 [ %indvars.iv10.us.unr37, %for.inc27.lr.ph.us.preheader.new ], [ %indvars.iv.next11.us.3.1, %for.inc27.lr.ph.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv10.us, i64 0
  %scevgep24 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24, i8 0, i64 %2, i32 8, i1 false)
  %indvars.iv.next11.us = add nuw nsw i64 %indvars.iv10.us, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next11.us, i64 0
  %scevgep24.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.1, i8 0, i64 %2, i32 8, i1 false)
  %indvars.iv.next11.us.1 = add nsw i64 %indvars.iv10.us, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next11.us.1, i64 0
  %scevgep24.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.2, i8 0, i64 %2, i32 8, i1 false)
  %indvars.iv.next11.us.2 = add nsw i64 %indvars.iv10.us, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next11.us.2, i64 0
  %scevgep24.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.3, i8 0, i64 %2, i32 8, i1 false)
  %indvars.iv.next11.us.3 = add nsw i64 %indvars.iv10.us, 4
  %scevgep.138 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next11.us.3, i64 0
  %scevgep24.139 = bitcast double* %scevgep.138 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.139, i8 0, i64 %2, i32 8, i1 false)
  %indvars.iv.next11.us.140 = add nsw i64 %indvars.iv10.us, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next11.us.140, i64 0
  %scevgep24.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.1.1, i8 0, i64 %2, i32 8, i1 false)
  %indvars.iv.next11.us.1.1 = add nsw i64 %indvars.iv10.us, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next11.us.1.1, i64 0
  %scevgep24.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.2.1, i8 0, i64 %2, i32 8, i1 false)
  %indvars.iv.next11.us.2.1 = add nsw i64 %indvars.iv10.us, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next11.us.2.1, i64 0
  %scevgep24.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.3.1, i8 0, i64 %2, i32 8, i1 false)
  %indvars.iv.next11.us.3.1 = add nsw i64 %indvars.iv10.us, 8
  %exitcond13.us.3.1 = icmp eq i64 %indvars.iv.next11.us.3.1, %wide.trip.count
  br i1 %exitcond13.us.3.1, label %for.end32.loopexit, label %for.inc27.lr.ph.us

for.end32.loopexit:                               ; preds = %for.inc27.lr.ph.us
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %for.inc27.lr.ph.us.prol.loopexit29, %for.inc27.lr.ph.us.prol.loopexit, %for.cond15.preheader, %for.cond1.preheader.lr.ph
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  %cmp13 = icmp sgt i32 %n, 0
  br i1 %cmp13, label %for.cond1.preheader.lr.ph, label %for.end88

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = sext i32 %n to i64
  %wide.trip.count = zext i32 %m to i64
  %wide.trip.count57 = zext i32 %n to i64
  %1 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 3
  %xtraiter73 = and i64 %wide.trip.count, 1
  %2 = icmp sgt i32 %m, 0
  %3 = icmp eq i64 %xtraiter, 0
  %4 = icmp ult i64 %1, 3
  %5 = icmp eq i64 %xtraiter73, 0
  %6 = icmp eq i64 %1, 0
  %7 = icmp sgt i32 %m, 0
  %8 = icmp eq i64 %xtraiter73, 0
  %sunkaddr = ptrtoint [1200 x double]* %Q to i64
  %9 = icmp eq i64 %1, 0
  %10 = icmp eq i64 %xtraiter73, 0
  %sunkaddr89 = ptrtoint [1200 x double]* %Q to i64
  %11 = icmp eq i64 %1, 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc86.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc86.for.cond1.preheader_crit_edge ], [ 1, %for.cond1.preheader.lr.ph ]
  %indvars.iv55 = phi i64 [ %13, %for.inc86.for.cond1.preheader_crit_edge ], [ 0, %for.cond1.preheader.lr.ph ]
  %sext93 = shl i64 %indvars.iv66, 32
  %12 = ashr exact i64 %sext93, 32
  %13 = add nuw i64 %indvars.iv55, 1
  %sext = shl i64 %13, 32
  %14 = ashr exact i64 %sext, 32
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv55, i64 %14
  %15 = add nuw i64 %indvars.iv55, 2
  %16 = trunc i64 %15 to i32
  %17 = icmp slt i32 %16, %n
  %smax = select i1 %17, i32 %n, i32 %16
  %18 = sub i64 -2, %indvars.iv55
  %19 = trunc i64 %18 to i32
  %20 = add i32 %smax, %19
  %21 = zext i32 %20 to i64
  %22 = shl nuw nsw i64 %21, 3
  %23 = add nuw nsw i64 %22, 8
  br i1 %2, label %for.inc.preheader, label %for.end.thread

for.end.thread:                                   ; preds = %for.cond1.preheader
  %arrayidx1380 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv55, i64 %indvars.iv55
  store double 0.000000e+00, double* %arrayidx1380, align 8
  br label %for.cond33.preheader

for.inc.preheader:                                ; preds = %for.cond1.preheader
  br i1 %3, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol.for.inc.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0, %for.inc.prol.preheader ]
  %nrm.03.prol = phi double [ %add.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0.000000e+00, %for.inc.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc.prol.for.inc.prol_crit_edge ], [ %xtraiter, %for.inc.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.prol, i64 %indvars.iv55
  %24 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %24, %24
  %add.prol = fadd double %nrm.03.prol, %mul.prol
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol.for.inc.prol_crit_edge, !llvm.loop !3

for.inc.prol.for.inc.prol_crit_edge:              ; preds = %for.inc.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.inc.prol

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.preheader
  %add.lcssa.unr = phi double [ undef, %for.inc.preheader ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %for.inc.preheader ], [ %xtraiter, %for.inc.prol.loopexit.loopexit ]
  %nrm.03.unr = phi double [ 0.000000e+00, %for.inc.preheader ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  br i1 %4, label %for.end, label %for.inc.preheader85

for.inc.preheader85:                              ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader85, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc ], [ %indvars.iv.unr, %for.inc.preheader85 ]
  %nrm.03 = phi double [ %add.3, %for.inc ], [ %nrm.03.unr, %for.inc.preheader85 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv55
  %25 = load double, double* %arrayidx5, align 8
  %mul = fmul double %25, %25
  %add = fadd double %nrm.03, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv55
  %26 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %26, %26
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv55
  %27 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %27, %27
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv55
  %28 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %28, %28
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count
  br i1 %exitcond.3, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit
  %nrm.0.lcssa = phi double [ %add.lcssa.unr, %for.inc.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %nrm.0.lcssa) #3
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv55, i64 %indvars.iv55
  store double %call, double* %arrayidx13, align 8
  br i1 %5, label %for.inc29.prol.loopexit.unr-lcssa, label %for.inc29.prol.preheader

for.inc29.prol.preheader:                         ; preds = %for.end
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv55
  %29 = load double, double* %arrayidx20.prol, align 8
  %div.prol = fdiv double %29, %call
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv55
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.inc29.prol.loopexit.unr-lcssa

for.inc29.prol.loopexit.unr-lcssa:                ; preds = %for.end, %for.inc29.prol.preheader
  %indvars.iv15.unr.ph = phi i64 [ 1, %for.inc29.prol.preheader ], [ 0, %for.end ]
  br i1 %6, label %for.cond33.preheader, label %for.inc29.preheader

for.inc29.preheader:                              ; preds = %for.inc29.prol.loopexit.unr-lcssa
  br label %for.inc29

for.cond33.preheader.loopexit:                    ; preds = %for.inc29
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.cond33.preheader.loopexit, %for.inc29.prol.loopexit.unr-lcssa, %for.end.thread
  %cmp3411 = icmp slt i64 %13, %0
  br i1 %cmp3411, label %for.body35.lr.ph, label %for.inc86

for.body35.lr.ph:                                 ; preds = %for.cond33.preheader
  br i1 %7, label %for.inc57.lr.ph.us.preheader, label %for.body35.preheader

for.inc57.lr.ph.us.preheader:                     ; preds = %for.body35.lr.ph
  %sunkaddr86 = shl i64 %indvars.iv55, 3
  %sunkaddr87 = add i64 %sunkaddr, %sunkaddr86
  %sunkaddr88 = inttoptr i64 %sunkaddr87 to double*
  %sunkaddr90 = shl i64 %indvars.iv55, 3
  %sunkaddr91 = add i64 %sunkaddr89, %sunkaddr90
  %sunkaddr92 = inttoptr i64 %sunkaddr91 to double*
  br label %for.inc57.lr.ph.us

for.body35.preheader:                             ; preds = %for.body35.lr.ph
  %30 = bitcast double* %scevgep64 to i8*
  call void @llvm.memset.p0i8.i64(i8* %30, i8 0, i64 %23, i32 8, i1 false)
  br label %for.inc86

for.inc57.lr.ph.us:                               ; preds = %for.cond33.loopexit.us, %for.inc57.lr.ph.us.preheader
  %indvars.iv68 = phi i64 [ %12, %for.inc57.lr.ph.us.preheader ], [ %indvars.iv.next69, %for.cond33.loopexit.us ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv55, i64 %indvars.iv68
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 %8, label %for.inc57.us.prol.loopexit.unr-lcssa, label %for.inc57.us.prol.preheader

for.inc57.us.prol.preheader:                      ; preds = %for.inc57.lr.ph.us
  %31 = load double, double* %sunkaddr88, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv68
  %32 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %31, %32
  %add56.us.prol = fadd double %mul51.us.prol, 0.000000e+00
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.inc57.us.prol.loopexit.unr-lcssa

for.inc57.us.prol.loopexit.unr-lcssa:             ; preds = %for.inc57.lr.ph.us, %for.inc57.us.prol.preheader
  %33 = phi double [ %add56.us.prol, %for.inc57.us.prol.preheader ], [ 0.000000e+00, %for.inc57.lr.ph.us ]
  %indvars.iv19.us.unr.ph = phi i64 [ 1, %for.inc57.us.prol.preheader ], [ 0, %for.inc57.lr.ph.us ]
  br i1 %9, label %for.inc80.us.preheader, label %for.inc57.us.preheader

for.inc57.us.preheader:                           ; preds = %for.inc57.us.prol.loopexit.unr-lcssa
  br label %for.inc57.us

for.inc57.us:                                     ; preds = %for.inc57.us.preheader, %for.inc57.us
  %34 = phi double [ %add56.us.1, %for.inc57.us ], [ %33, %for.inc57.us.preheader ]
  %indvars.iv19.us = phi i64 [ %indvars.iv.next20.us.1, %for.inc57.us ], [ %indvars.iv19.us.unr.ph, %for.inc57.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv19.us, i64 %indvars.iv55
  %35 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv19.us, i64 %indvars.iv68
  %36 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %35, %36
  %add56.us = fadd double %34, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next20.us = add nuw nsw i64 %indvars.iv19.us, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next20.us, i64 %indvars.iv55
  %37 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next20.us, i64 %indvars.iv68
  %38 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %37, %38
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next20.us.1 = add nuw nsw i64 %indvars.iv19.us, 2
  %exitcond22.us.1 = icmp eq i64 %indvars.iv.next20.us.1, %wide.trip.count
  br i1 %exitcond22.us.1, label %for.inc80.us.preheader.loopexit, label %for.inc57.us

for.inc80.us.preheader.loopexit:                  ; preds = %for.inc57.us
  br label %for.inc80.us.preheader

for.inc80.us.preheader:                           ; preds = %for.inc80.us.preheader.loopexit, %for.inc57.us.prol.loopexit.unr-lcssa
  %39 = phi double [ %33, %for.inc57.us.prol.loopexit.unr-lcssa ], [ %add56.us.1, %for.inc80.us.preheader.loopexit ]
  br i1 %10, label %for.inc80.us.prol.loopexit.unr-lcssa, label %for.inc80.us.prol.preheader

for.inc80.us.prol.preheader:                      ; preds = %for.inc80.us.preheader
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv68
  %40 = load double, double* %arrayidx66.us.prol, align 8
  %41 = load double, double* %sunkaddr92, align 8
  %mul75.us.prol = fmul double %41, %39
  %sub.us.prol = fsub double %40, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.inc80.us.prol.loopexit.unr-lcssa

for.inc80.us.prol.loopexit.unr-lcssa:             ; preds = %for.inc80.us.preheader, %for.inc80.us.prol.preheader
  %indvars.iv23.us.unr.ph = phi i64 [ 1, %for.inc80.us.prol.preheader ], [ 0, %for.inc80.us.preheader ]
  br i1 %11, label %for.cond33.loopexit.us, label %for.inc80.us.preheader84

for.inc80.us.preheader84:                         ; preds = %for.inc80.us.prol.loopexit.unr-lcssa
  br label %for.inc80.us

for.inc80.us:                                     ; preds = %for.inc80.us.preheader84, %for.inc80.us
  %indvars.iv23.us = phi i64 [ %indvars.iv.next24.us.1, %for.inc80.us ], [ %indvars.iv23.us.unr.ph, %for.inc80.us.preheader84 ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv23.us, i64 %indvars.iv68
  %42 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv23.us, i64 %indvars.iv55
  %43 = load double, double* %arrayidx70.us, align 8
  %44 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %43, %44
  %sub.us = fsub double %42, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next24.us = add nuw nsw i64 %indvars.iv23.us, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next24.us, i64 %indvars.iv68
  %45 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next24.us, i64 %indvars.iv55
  %46 = load double, double* %arrayidx70.us.1, align 8
  %47 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %46, %47
  %sub.us.1 = fsub double %45, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next24.us.1 = add nuw nsw i64 %indvars.iv23.us, 2
  %exitcond26.us.1 = icmp eq i64 %indvars.iv.next24.us.1, %wide.trip.count
  br i1 %exitcond26.us.1, label %for.cond33.loopexit.us.loopexit, label %for.inc80.us

for.cond33.loopexit.us.loopexit:                  ; preds = %for.inc80.us
  br label %for.cond33.loopexit.us

for.cond33.loopexit.us:                           ; preds = %for.cond33.loopexit.us.loopexit, %for.inc80.us.prol.loopexit.unr-lcssa
  %indvars.iv.next69 = add nsw i64 %indvars.iv68, 1
  %cmp34.us = icmp slt i64 %indvars.iv.next69, %0
  br i1 %cmp34.us, label %for.inc57.lr.ph.us, label %for.inc86.loopexit

for.inc29:                                        ; preds = %for.inc29.preheader, %for.inc29
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %for.inc29 ], [ %indvars.iv15.unr.ph, %for.inc29.preheader ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv55
  %48 = load double, double* %arrayidx20, align 8
  %49 = load double, double* %arrayidx13, align 8
  %div = fdiv double %48, %49
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv15, i64 %indvars.iv55
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next16, i64 %indvars.iv55
  %50 = load double, double* %arrayidx20.1, align 8
  %51 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %50, %51
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next16, i64 %indvars.iv55
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next16.1 = add nuw nsw i64 %indvars.iv15, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next16.1, %wide.trip.count
  br i1 %exitcond18.1, label %for.cond33.preheader.loopexit, label %for.inc29

for.inc86.loopexit:                               ; preds = %for.cond33.loopexit.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit, %for.cond33.preheader, %for.body35.preheader
  %exitcond58 = icmp eq i64 %13, %wide.trip.count57
  br i1 %exitcond58, label %for.end88.loopexit, label %for.inc86.for.cond1.preheader_crit_edge

for.inc86.for.cond1.preheader_crit_edge:          ; preds = %for.inc86
  %indvars.iv.next67 = add nsw i64 %12, 1
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
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond2.preheader.lr.ph, label %for.end12

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count20 = zext i32 %n to i64
  br label %for.body4.lr.ph.us

for.body4.lr.ph.us:                               ; preds = %for.inc10.us, %for.cond2.preheader.lr.ph
  %indvars.iv22.us = phi i64 [ 0, %for.cond2.preheader.lr.ph ], [ %indvars.iv.next23.us, %for.inc10.us ]
  %4 = mul nsw i64 %indvars.iv22.us, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body4.lr.ph.us
  %indvars.iv17.us = phi i64 [ 0, %for.body4.lr.ph.us ], [ %indvars.iv.next18.us, %for.inc.us ]
  %5 = add nsw i64 %indvars.iv17.us, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv22.us, i64 %indvars.iv17.us
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv17.us, 1
  %exitcond21.us = icmp eq i64 %indvars.iv.next18.us, %wide.trip.count20
  br i1 %exitcond21.us, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next23.us = add nuw nsw i64 %indvars.iv22.us, 1
  %exitcond26.us = icmp eq i64 %indvars.iv.next23.us, %wide.trip.count20
  br i1 %exitcond26.us, label %for.end12.loopexit, label %for.body4.lr.ph.us

for.end12.loopexit:                               ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %cmp163 = icmp sgt i32 %m, 0
  br i1 %cmp163, label %for.cond18.preheader.lr.ph, label %for.end38

for.cond18.preheader.lr.ph:                       ; preds = %for.end12
  %12 = icmp sgt i32 %n, 0
  %13 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count15 = zext i32 %m to i64
  br i1 %12, label %for.body20.lr.ph.us.preheader, label %for.end38

for.body20.lr.ph.us.preheader:                    ; preds = %for.cond18.preheader.lr.ph
  br label %for.body20.lr.ph.us

for.body20.lr.ph.us:                              ; preds = %for.body20.lr.ph.us.preheader, %for.inc36.us
  %indvars.iv12.us = phi i64 [ %indvars.iv.next13.us, %for.inc36.us ], [ 0, %for.body20.lr.ph.us.preheader ]
  %14 = mul nsw i64 %indvars.iv12.us, %13
  br label %for.body20.us

for.body20.us:                                    ; preds = %for.inc33.us, %for.body20.lr.ph.us
  %indvars.iv.us = phi i64 [ 0, %for.body20.lr.ph.us ], [ %indvars.iv.next.us, %for.inc33.us ]
  %15 = add nsw i64 %indvars.iv.us, %14
  %16 = trunc i64 %15 to i32
  %rem23.us = srem i32 %16, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %for.inc33.us

if.then25.us:                                     ; preds = %for.body20.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.body20.us, %if.then25.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv12.us, i64 %indvars.iv.us
  %19 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %wide.trip.count
  br i1 %exitcond.us, label %for.inc36.us, label %for.body20.us

for.inc36.us:                                     ; preds = %for.inc33.us
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv12.us, 1
  %exitcond16.us = icmp eq i64 %indvars.iv.next13.us, %wide.trip.count15
  br i1 %exitcond16.us, label %for.end38.loopexit, label %for.body20.lr.ph.us

for.end38.loopexit:                               ; preds = %for.inc36.us
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.cond18.preheader.lr.ph, %for.end12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
