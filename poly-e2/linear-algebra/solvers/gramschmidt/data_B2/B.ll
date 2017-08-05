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
  %0 = sext i32 %n to i64
  %1 = sext i32 %m to i64
  %cmp17 = icmp sgt i32 %m, 0
  br i1 %cmp17, label %for.cond1.preheader.lr.ph, label %for.cond15.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp214 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  br i1 %cmp214, label %for.cond1.preheader.us.preheader, label %for.end32

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc12_crit_edge.us
  %indvars.iv718.us = phi i64 [ %indvars.iv.next8.us, %for.cond1.for.inc12_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv315.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next4.us, %for.body3.us ]
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
  %exitcond24 = icmp eq i64 %indvars.iv.next4.us, %0
  br i1 %exitcond24, label %for.cond1.for.inc12_crit_edge.us, label %for.body3.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv718.us, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next8.us, %1
  br i1 %exitcond27, label %for.cond15.preheader.loopexit, label %for.cond1.preheader.us

for.cond15.preheader.loopexit:                    ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  %cmp1611 = icmp sgt i32 %n, 0
  br i1 %cmp1611, label %for.cond19.preheader.preheader, label %for.end32

for.cond19.preheader.preheader:                   ; preds = %for.cond15.preheader
  %wide.trip.count = zext i32 %n to i64
  %4 = shl nuw nsw i64 %wide.trip.count, 3
  %5 = add nsw i64 %0, -1
  %xtraiter = and i64 %0, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond19.preheader.prol.loopexit, label %for.inc30.prol.preheader

for.inc30.prol.preheader:                         ; preds = %for.cond19.preheader.preheader
  br label %for.inc30.prol

for.inc30.prol:                                   ; preds = %for.inc30.prol.preheader, %for.inc30.prol
  %indvars.iv112.prol = phi i64 [ %indvars.iv.next2.prol, %for.inc30.prol ], [ 0, %for.inc30.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc30.prol ], [ %xtraiter, %for.inc30.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv112.prol, i64 0
  %scevgep22.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.prol, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.prol = add nuw nsw i64 %indvars.iv112.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond19.preheader.prol.loopexit.loopexit, label %for.inc30.prol, !llvm.loop !1

for.cond19.preheader.prol.loopexit.loopexit:      ; preds = %for.inc30.prol
  br label %for.cond19.preheader.prol.loopexit

for.cond19.preheader.prol.loopexit:               ; preds = %for.cond19.preheader.prol.loopexit.loopexit, %for.cond19.preheader.preheader
  %indvars.iv112.unr = phi i64 [ 0, %for.cond19.preheader.preheader ], [ %xtraiter, %for.cond19.preheader.prol.loopexit.loopexit ]
  %6 = icmp ult i64 %5, 3
  br i1 %6, label %for.end32, label %for.inc30.3.preheader

for.inc30.3.preheader:                            ; preds = %for.cond19.preheader.prol.loopexit
  %7 = add nsw i64 %0, -4
  %8 = sub nsw i64 %7, %indvars.iv112.unr
  %9 = lshr i64 %8, 2
  %10 = and i64 %9, 1
  %lcmp.mod31 = icmp eq i64 %10, 0
  br i1 %lcmp.mod31, label %for.inc30.3.prol.preheader, label %for.inc30.3.prol.loopexit

for.inc30.3.prol.preheader:                       ; preds = %for.inc30.3.preheader
  br label %for.inc30.3.prol

for.inc30.3.prol:                                 ; preds = %for.inc30.3.prol.preheader
  %scevgep.prol33 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv112.unr, i64 0
  %scevgep22.prol34 = bitcast double* %scevgep.prol33 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.prol34, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.prol35 = add nuw nsw i64 %indvars.iv112.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.prol35, i64 0
  %scevgep22.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.1.prol, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.1.prol = add nuw nsw i64 %indvars.iv112.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.1.prol, i64 0
  %scevgep22.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.2.prol, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.2.prol = add nuw nsw i64 %indvars.iv112.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.2.prol, i64 0
  %scevgep22.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.3.prol, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.3.prol = or i64 %indvars.iv112.unr, 4
  br label %for.inc30.3.prol.loopexit

for.inc30.3.prol.loopexit:                        ; preds = %for.inc30.3.prol, %for.inc30.3.preheader
  %indvars.iv112.unr36 = phi i64 [ %indvars.iv112.unr, %for.inc30.3.preheader ], [ %indvars.iv.next2.3.prol, %for.inc30.3.prol ]
  %11 = icmp eq i64 %9, 0
  br i1 %11, label %for.end32.loopexit, label %for.inc30.3.preheader.new

for.inc30.3.preheader.new:                        ; preds = %for.inc30.3.prol.loopexit
  br label %for.inc30.3

for.end32.loopexit.unr-lcssa:                     ; preds = %for.inc30.3
  br label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.inc30.3.prol.loopexit, %for.end32.loopexit.unr-lcssa
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %for.cond1.preheader.lr.ph, %for.cond19.preheader.prol.loopexit, %for.cond15.preheader
  ret void

for.inc30.3:                                      ; preds = %for.inc30.3, %for.inc30.3.preheader.new
  %indvars.iv112 = phi i64 [ %indvars.iv112.unr36, %for.inc30.3.preheader.new ], [ %indvars.iv.next2.3.1, %for.inc30.3 ]
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
  %indvars.iv.next2.3 = add nuw nsw i64 %indvars.iv112, 4
  %scevgep.137 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.3, i64 0
  %scevgep22.138 = bitcast double* %scevgep.137 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.138, i8 0, i64 %4, i32 8, i1 false)
  %indvars.iv.next2.139 = add nsw i64 %indvars.iv112, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.139, i64 0
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
  %exitcond23.3.1 = icmp eq i64 %indvars.iv.next2.3.1, %0
  br i1 %exitcond23.3.1, label %for.end32.loopexit.unr-lcssa, label %for.inc30.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  %0 = sext i32 %m to i64
  %1 = sext i32 %n to i64
  %cmp52 = icmp sgt i32 %n, 0
  br i1 %cmp52, label %for.cond1.preheader.lr.ph, label %for.end88

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %2 = add i32 %n, -1
  %cmp213 = icmp sgt i32 %m, 0
  %cmp1516 = icmp sgt i32 %m, 0
  %wide.trip.count = zext i32 %2 to i64
  %cmp4118 = icmp sgt i32 %m, 0
  %cmp6120 = icmp sgt i32 %m, 0
  %3 = shl nuw nsw i64 %wide.trip.count, 3
  %4 = add nsw i64 %0, -1
  %xtraiter = and i64 %0, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %5 = icmp ult i64 %4, 3
  %xtraiter66 = and i64 %0, 1
  %lcmp.mod67 = icmp eq i64 %xtraiter66, 0
  %6 = icmp eq i64 %4, 0
  %xtraiter68 = and i64 %0, 1
  %lcmp.mod69 = icmp eq i64 %xtraiter68, 0
  %7 = icmp eq i64 %4, 0
  %xtraiter70 = and i64 %0, 1
  %lcmp.mod71 = icmp eq i64 %xtraiter70, 0
  %8 = icmp eq i64 %4, 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc86, %for.cond1.preheader.lr.ph
  %indvars.iv1153 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next12, %for.inc86 ]
  %9 = mul nuw nsw i64 %indvars.iv1153, 1201
  %10 = add nuw nsw i64 %9, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %10
  %scevgep60 = bitcast double* %scevgep to i8*
  %11 = mul nsw i64 %indvars.iv1153, -8
  %12 = add nsw i64 %3, %11
  br i1 %cmp213, label %for.body3.preheader, label %for.end

for.body3.preheader:                              ; preds = %for.cond1.preheader
  br i1 %lcmp.mod, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.preheader
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol
  %nrm.015.prol = phi double [ %add.prol, %for.body3.prol ], [ 0.000000e+00, %for.body3.prol.preheader ]
  %indvars.iv14.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.prol ], [ %xtraiter, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv14.prol, i64 %indvars.iv1153
  %13 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %13, %13
  %add.prol = fadd double %nrm.015.prol, %mul.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv14.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !3

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.preheader
  %nrm.015.unr = phi double [ 0.000000e+00, %for.body3.preheader ], [ %add.prol, %for.body3.prol.loopexit.loopexit ]
  %indvars.iv14.unr = phi i64 [ 0, %for.body3.preheader ], [ %xtraiter, %for.body3.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.body3.preheader ], [ %add.prol, %for.body3.prol.loopexit.loopexit ]
  br i1 %5, label %for.end, label %for.body3.preheader80

for.body3.preheader80:                            ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader80, %for.body3
  %nrm.015 = phi double [ %add.3, %for.body3 ], [ %nrm.015.unr, %for.body3.preheader80 ]
  %indvars.iv14 = phi i64 [ %indvars.iv.next.3, %for.body3 ], [ %indvars.iv14.unr, %for.body3.preheader80 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv1153
  %14 = load double, double* %arrayidx5, align 8
  %mul = fmul double %14, %14
  %add = fadd double %nrm.015, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv1153
  %15 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %15, %15
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv14, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv1153
  %16 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %16, %16
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv14, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv1153
  %17 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %17, %17
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv14, 4
  %exitcond58.3 = icmp eq i64 %indvars.iv.next.3, %0
  br i1 %exitcond58.3, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3.prol.loopexit, %for.cond1.preheader
  %nrm.0.lcssa = phi double [ 0.000000e+00, %for.cond1.preheader ], [ %add.lcssa.unr, %for.body3.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %nrm.0.lcssa) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv1153, i64 %indvars.iv1153
  store double %call, double* %arrayidx13, align 8
  br i1 %cmp1516, label %for.body16.preheader, label %for.cond33.preheader

for.body16.preheader:                             ; preds = %for.end
  br i1 %lcmp.mod67, label %for.body16.prol.loopexit, label %for.body16.prol

for.body16.prol:                                  ; preds = %for.body16.preheader
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv1153
  %18 = load double, double* %arrayidx20.prol, align 8
  %19 = load double, double* %arrayidx13, align 8
  %div.prol = fdiv double %18, %19
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv1153
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.body16.prol.loopexit

for.body16.prol.loopexit:                         ; preds = %for.body16.prol, %for.body16.preheader
  %indvars.iv117.unr.ph = phi i64 [ 1, %for.body16.prol ], [ 0, %for.body16.preheader ]
  br i1 %6, label %for.cond33.preheader, label %for.body16.preheader79

for.body16.preheader79:                           ; preds = %for.body16.prol.loopexit
  br label %for.body16

for.cond33.preheader.loopexit:                    ; preds = %for.body16
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.cond33.preheader.loopexit, %for.body16.prol.loopexit, %for.end
  %exitcond23 = icmp eq i64 %indvars.iv1153, %wide.trip.count
  br i1 %exitcond23, label %for.inc86, label %for.body35.lr.ph

for.body35.lr.ph:                                 ; preds = %for.cond33.preheader
  br i1 %cmp4118, label %for.body35.us.preheader, label %for.inc86.loopexit57

for.body35.us.preheader:                          ; preds = %for.body35.lr.ph
  %arrayidx70.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv1153
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv1153
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.body35.us.preheader, %for.cond33.loopexit.us
  %indvars.iv.next1024.us.in = phi i64 [ %indvars.iv.next1024.us, %for.cond33.loopexit.us ], [ %indvars.iv1153, %for.body35.us.preheader ]
  %indvars.iv.next1024.us = add nuw nsw i64 %indvars.iv.next1024.us.in, 1
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv1153, i64 %indvars.iv.next1024.us
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 %lcmp.mod69, label %for.body42.us.prol.loopexit, label %for.body42.us.prol

for.body42.us.prol:                               ; preds = %for.body35.us
  %20 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv.next1024.us
  %21 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %20, %21
  %22 = load double, double* %arrayidx39.us, align 8
  %add56.us.prol = fadd double %22, %mul51.us.prol
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.body42.us.prol.loopexit

for.body42.us.prol.loopexit:                      ; preds = %for.body42.us.prol, %for.body35.us
  %indvars.iv319.us.unr.ph = phi i64 [ 1, %for.body42.us.prol ], [ 0, %for.body35.us ]
  br i1 %7, label %for.cond40.for.cond60.preheader_crit_edge.us, label %for.body42.us.preheader

for.body42.us.preheader:                          ; preds = %for.body42.us.prol.loopexit
  br label %for.body42.us

for.body62.us:                                    ; preds = %for.body62.us.preheader78, %for.body62.us
  %indvars.iv521.us = phi i64 [ %indvars.iv.next6.us.1, %for.body62.us ], [ %indvars.iv521.us.unr.ph, %for.body62.us.preheader78 ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv521.us, i64 %indvars.iv.next1024.us
  %23 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv521.us, i64 %indvars.iv1153
  %24 = load double, double* %arrayidx70.us, align 8
  %25 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %24, %25
  %sub.us = fsub double %23, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv521.us, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next6.us, i64 %indvars.iv.next1024.us
  %26 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next6.us, i64 %indvars.iv1153
  %27 = load double, double* %arrayidx70.us.1, align 8
  %28 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %27, %28
  %sub.us.1 = fsub double %26, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next6.us.1 = add nuw nsw i64 %indvars.iv521.us, 2
  %exitcond62.1 = icmp eq i64 %indvars.iv.next6.us.1, %0
  br i1 %exitcond62.1, label %for.cond33.loopexit.us.loopexit, label %for.body62.us

for.body42.us:                                    ; preds = %for.body42.us.preheader, %for.body42.us
  %indvars.iv319.us = phi i64 [ %indvars.iv.next4.us.1, %for.body42.us ], [ %indvars.iv319.us.unr.ph, %for.body42.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv319.us, i64 %indvars.iv1153
  %29 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv319.us, i64 %indvars.iv.next1024.us
  %30 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %29, %30
  %31 = load double, double* %arrayidx39.us, align 8
  %add56.us = fadd double %31, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv319.us, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next4.us, i64 %indvars.iv1153
  %32 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next4.us, i64 %indvars.iv.next1024.us
  %33 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %32, %33
  %34 = load double, double* %arrayidx39.us, align 8
  %add56.us.1 = fadd double %34, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next4.us.1 = add nuw nsw i64 %indvars.iv319.us, 2
  %exitcond61.1 = icmp eq i64 %indvars.iv.next4.us.1, %0
  br i1 %exitcond61.1, label %for.cond40.for.cond60.preheader_crit_edge.us.loopexit, label %for.body42.us

for.cond33.loopexit.us.loopexit:                  ; preds = %for.body62.us
  br label %for.cond33.loopexit.us

for.cond33.loopexit.us:                           ; preds = %for.cond33.loopexit.us.loopexit, %for.body62.us.prol.loopexit, %for.cond40.for.cond60.preheader_crit_edge.us
  %exitcond.us = icmp eq i64 %indvars.iv.next1024.us, %wide.trip.count
  br i1 %exitcond.us, label %for.inc86.loopexit, label %for.body35.us

for.cond40.for.cond60.preheader_crit_edge.us.loopexit: ; preds = %for.body42.us
  br label %for.cond40.for.cond60.preheader_crit_edge.us

for.cond40.for.cond60.preheader_crit_edge.us:     ; preds = %for.cond40.for.cond60.preheader_crit_edge.us.loopexit, %for.body42.us.prol.loopexit
  br i1 %cmp6120, label %for.body62.us.preheader, label %for.cond33.loopexit.us

for.body62.us.preheader:                          ; preds = %for.cond40.for.cond60.preheader_crit_edge.us
  br i1 %lcmp.mod71, label %for.body62.us.prol.loopexit, label %for.body62.us.prol

for.body62.us.prol:                               ; preds = %for.body62.us.preheader
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv.next1024.us
  %35 = load double, double* %arrayidx66.us.prol, align 8
  %36 = load double, double* %arrayidx70.us.prol, align 8
  %37 = load double, double* %arrayidx39.us, align 8
  %mul75.us.prol = fmul double %36, %37
  %sub.us.prol = fsub double %35, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.body62.us.prol.loopexit

for.body62.us.prol.loopexit:                      ; preds = %for.body62.us.prol, %for.body62.us.preheader
  %indvars.iv521.us.unr.ph = phi i64 [ 1, %for.body62.us.prol ], [ 0, %for.body62.us.preheader ]
  br i1 %8, label %for.cond33.loopexit.us, label %for.body62.us.preheader78

for.body62.us.preheader78:                        ; preds = %for.body62.us.prol.loopexit
  br label %for.body62.us

for.body16:                                       ; preds = %for.body16.preheader79, %for.body16
  %indvars.iv117 = phi i64 [ %indvars.iv.next2.1, %for.body16 ], [ %indvars.iv117.unr.ph, %for.body16.preheader79 ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv117, i64 %indvars.iv1153
  %38 = load double, double* %arrayidx20, align 8
  %39 = load double, double* %arrayidx13, align 8
  %div = fdiv double %38, %39
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv117, i64 %indvars.iv1153
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv117, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next2, i64 %indvars.iv1153
  %40 = load double, double* %arrayidx20.1, align 8
  %41 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %40, %41
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next2, i64 %indvars.iv1153
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next2.1 = add nuw nsw i64 %indvars.iv117, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next2.1, %0
  br i1 %exitcond59.1, label %for.cond33.preheader.loopexit, label %for.body16

for.inc86.loopexit57:                             ; preds = %for.body35.lr.ph
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep60, i8 0, i64 %12, i32 8, i1 false)
  br label %for.inc86

for.inc86.loopexit:                               ; preds = %for.cond33.loopexit.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit, %for.inc86.loopexit57, %for.cond33.preheader
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1153, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next12, %1
  br i1 %exitcond65, label %for.end88.loopexit, label %for.cond1.preheader

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
  %3 = sext i32 %n to i64
  %cmp21 = icmp sgt i32 %n, 0
  br i1 %cmp21, label %for.cond2.preheader.preheader, label %for.end12

for.cond2.preheader.preheader:                    ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %for.cond2.preheader.preheader
  %indvars.iv822 = phi i64 [ %indvars.iv.next9, %for.inc10 ], [ 0, %for.cond2.preheader.preheader ]
  %4 = mul nsw i64 %indvars.iv822, %3
  br label %for.body4

for.body4:                                        ; preds = %for.cond2.preheader, %if.end
  %indvars.iv520 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next6, %if.end ]
  %5 = add nsw i64 %indvars.iv520, %4
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc13 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #6
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv822, i64 %indvars.iv520
  %9 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #7
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv520, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, %wide.trip.count
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv822, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next9, %3
  br i1 %exitcond29, label %for.end12.loopexit, label %for.cond2.preheader

for.end12.loopexit:                               ; preds = %for.inc10
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %12 = sext i32 %m to i64
  %cmp1616 = icmp sgt i32 %m, 0
  %cmp1914 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp1616, %cmp1914
  br i1 %or.cond, label %for.cond18.preheader.us.preheader, label %for.end38

for.cond18.preheader.us.preheader:                ; preds = %for.end12
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.preheader.us.preheader, %for.cond18.for.inc36_crit_edge.us
  %indvars.iv217.us = phi i64 [ %indvars.iv.next3.us, %for.cond18.for.inc36_crit_edge.us ], [ 0, %for.cond18.preheader.us.preheader ]
  %13 = mul nsw i64 %indvars.iv217.us, %3
  br label %for.body20.us

for.body20.us:                                    ; preds = %if.end27.us, %for.cond18.preheader.us
  %indvars.iv15.us = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next.us, %if.end27.us ]
  %14 = add nsw i64 %indvars.iv15.us, %13
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
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv217.us, i64 %indvars.iv15.us
  %18 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv15.us, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next.us, %3
  br i1 %exitcond26, label %for.cond18.for.inc36_crit_edge.us, label %for.body20.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %if.end27.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv217.us, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next3.us, %12
  br i1 %exitcond27, label %for.end38.loopexit, label %for.cond18.preheader.us

for.end38.loopexit:                               ; preds = %for.cond18.for.inc36_crit_edge.us
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.end12
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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
