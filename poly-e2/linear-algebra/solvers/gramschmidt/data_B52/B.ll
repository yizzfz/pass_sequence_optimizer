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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
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
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  %cmp24 = icmp sgt i32 %m, 0
  br i1 %cmp24, label %for.cond1.preheader.lr.ph, label %entry.for.cond15.preheader_crit_edge

entry.for.cond15.preheader_crit_edge:             ; preds = %entry
  br label %for.cond15.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp222 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  br i1 %cmp222, label %for.body3.lr.ph.us.preheader, label %for.cond1.preheader.lr.ph.for.end32_crit_edge

for.cond1.preheader.lr.ph.for.end32_crit_edge:    ; preds = %for.cond1.preheader.lr.ph
  br label %for.end32

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %0 = zext i32 %n to i64
  %1 = zext i32 %m to i64
  br label %for.body3.lr.ph.us

for.body3.lr.ph.us:                               ; preds = %for.inc12.us.for.body3.lr.ph.us_crit_edge, %for.body3.lr.ph.us.preheader
  %indvars.iv40 = phi i64 [ 0, %for.body3.lr.ph.us.preheader ], [ %indvars.iv.next41, %for.inc12.us.for.body3.lr.ph.us_crit_edge ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.body3.lr.ph.us
  %indvars.iv33 = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next34, %for.body3.us.for.body3.us_crit_edge ]
  %2 = mul nuw nsw i64 %indvars.iv33, %indvars.iv40
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv40, i64 %indvars.iv33
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv40, i64 %indvars.iv33
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next34, %0
  br i1 %exitcond, label %for.inc12.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  br label %for.body3.us

for.inc12.us:                                     ; preds = %for.body3.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next41, %1
  br i1 %exitcond47, label %for.inc12.us.for.cond15.preheader_crit_edge, label %for.inc12.us.for.body3.lr.ph.us_crit_edge

for.inc12.us.for.body3.lr.ph.us_crit_edge:        ; preds = %for.inc12.us
  br label %for.body3.lr.ph.us

for.inc12.us.for.cond15.preheader_crit_edge:      ; preds = %for.inc12.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.inc12.us.for.cond15.preheader_crit_edge, %entry.for.cond15.preheader_crit_edge
  %cmp1620 = icmp sgt i32 %n, 0
  br i1 %cmp1620, label %for.body22.lr.ph.us.preheader, label %for.cond15.preheader.for.end32_crit_edge

for.cond15.preheader.for.end32_crit_edge:         ; preds = %for.cond15.preheader
  br label %for.end32

for.body22.lr.ph.us.preheader:                    ; preds = %for.cond15.preheader
  %4 = add i32 %n, -1
  %5 = zext i32 %4 to i64
  %6 = shl nuw nsw i64 %5, 3
  %7 = add nuw nsw i64 %6, 8
  %8 = zext i32 %n to i64
  %9 = add nsw i64 %8, -1
  %xtraiter = and i64 %8, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body22.lr.ph.us.preheader.for.body22.lr.ph.us.prol.loopexit_crit_edge, label %for.body22.lr.ph.us.preheader.for.body22.lr.ph.us.prol_crit_edge

for.body22.lr.ph.us.preheader.for.body22.lr.ph.us.prol_crit_edge: ; preds = %for.body22.lr.ph.us.preheader
  br label %for.body22.lr.ph.us.prol

for.body22.lr.ph.us.preheader.for.body22.lr.ph.us.prol.loopexit_crit_edge: ; preds = %for.body22.lr.ph.us.preheader
  br label %for.body22.lr.ph.us.prol.loopexit

for.body22.lr.ph.us.prol:                         ; preds = %for.body22.lr.ph.us.preheader.for.body22.lr.ph.us.prol_crit_edge, %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge
  %indvars.iv29.prol = phi i64 [ %indvars.iv.next30.prol, %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge ], [ 0, %for.body22.lr.ph.us.preheader.for.body22.lr.ph.us.prol_crit_edge ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge ], [ %xtraiter, %for.body22.lr.ph.us.preheader.for.body22.lr.ph.us.prol_crit_edge ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv29.prol, i64 0
  %scevgep28.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.prol, i8 0, i64 %7, i32 8, i1 false)
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol.loopexit_crit_edge, label %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge, !llvm.loop !1

for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol.loopexit_crit_edge: ; preds = %for.body22.lr.ph.us.prol
  br label %for.body22.lr.ph.us.prol.loopexit

for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge: ; preds = %for.body22.lr.ph.us.prol
  %indvars.iv.next30.prol = add nuw nsw i64 %indvars.iv29.prol, 1
  br label %for.body22.lr.ph.us.prol

for.body22.lr.ph.us.prol.loopexit:                ; preds = %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol.loopexit_crit_edge, %for.body22.lr.ph.us.preheader.for.body22.lr.ph.us.prol.loopexit_crit_edge
  %indvars.iv29.unr = phi i64 [ 0, %for.body22.lr.ph.us.preheader.for.body22.lr.ph.us.prol.loopexit_crit_edge ], [ %xtraiter, %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol.loopexit_crit_edge ]
  %10 = icmp ult i64 %9, 3
  br i1 %10, label %for.body22.lr.ph.us.prol.loopexit.for.end32_crit_edge, label %for.body22.lr.ph.us.prol.loopexit.for.body22.lr.ph.us_crit_edge

for.body22.lr.ph.us.prol.loopexit.for.body22.lr.ph.us_crit_edge: ; preds = %for.body22.lr.ph.us.prol.loopexit
  br label %for.body22.lr.ph.us

for.body22.lr.ph.us.prol.loopexit.for.end32_crit_edge: ; preds = %for.body22.lr.ph.us.prol.loopexit
  br label %for.end32

for.body22.lr.ph.us:                              ; preds = %for.body22.lr.ph.us.for.body22.lr.ph.us_crit_edge, %for.body22.lr.ph.us.prol.loopexit.for.body22.lr.ph.us_crit_edge
  %indvars.iv29 = phi i64 [ %indvars.iv29.unr, %for.body22.lr.ph.us.prol.loopexit.for.body22.lr.ph.us_crit_edge ], [ %indvars.iv.next30.3, %for.body22.lr.ph.us.for.body22.lr.ph.us_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv29, i64 0
  %scevgep28 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next30, i64 0
  %scevgep28.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next30.1, i64 0
  %scevgep28.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.2, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next30.2 = add nsw i64 %indvars.iv29, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next30.2, i64 0
  %scevgep28.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.3, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next30.3 = add nuw nsw i64 %indvars.iv29, 4
  %exitcond32.3 = icmp eq i64 %indvars.iv.next30.3, %8
  br i1 %exitcond32.3, label %for.body22.lr.ph.us.for.end32_crit_edge, label %for.body22.lr.ph.us.for.body22.lr.ph.us_crit_edge

for.body22.lr.ph.us.for.body22.lr.ph.us_crit_edge: ; preds = %for.body22.lr.ph.us
  br label %for.body22.lr.ph.us

for.body22.lr.ph.us.for.end32_crit_edge:          ; preds = %for.body22.lr.ph.us
  br label %for.end32

for.end32:                                        ; preds = %for.body22.lr.ph.us.for.end32_crit_edge, %for.body22.lr.ph.us.prol.loopexit.for.end32_crit_edge, %for.cond15.preheader.for.end32_crit_edge, %for.cond1.preheader.lr.ph.for.end32_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  %cmp66 = icmp sgt i32 %n, 0
  br i1 %cmp66, label %for.cond1.preheader.preheader, label %entry.for.end88_crit_edge

entry.for.end88_crit_edge:                        ; preds = %entry
  br label %for.end88

for.cond1.preheader.preheader:                    ; preds = %entry
  %0 = add i32 %n, -2
  %1 = zext i32 %0 to i64
  %2 = sext i32 %n to i64
  %3 = zext i32 %m to i64
  %4 = add nsw i64 %3, -1
  %5 = zext i32 %n to i64
  %6 = icmp sgt i32 %m, 0
  %xtraiter = and i64 %3, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %7 = icmp ult i64 %4, 3
  %xtraiter130 = and i64 %3, 1
  %lcmp.mod131 = icmp eq i64 %xtraiter130, 0
  %8 = icmp eq i64 %4, 0
  %lcmp.mod133 = icmp ne i64 %xtraiter130, 0
  br label %for.cond1.preheader

for.cond.loopexit:                                ; preds = %for.inc83.us.for.cond.loopexit_crit_edge, %for.end31.for.cond.loopexit_crit_edge, %for.body35.preheader
  %exitcond140 = icmp eq i64 %indvars.iv.next127, %5
  br i1 %exitcond140, label %for.cond.loopexit.for.end88_crit_edge, label %for.cond.loopexit.for.cond1.preheader_crit_edge

for.cond.loopexit.for.end88_crit_edge:            ; preds = %for.cond.loopexit
  br label %for.end88

for.cond.loopexit.for.cond1.preheader_crit_edge:  ; preds = %for.cond.loopexit
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.loopexit.for.cond1.preheader_crit_edge, %for.cond1.preheader.preheader
  %indvars.iv126 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next127, %for.cond.loopexit.for.cond1.preheader_crit_edge ]
  %indvars.iv118 = phi i64 [ 1, %for.cond1.preheader.preheader ], [ %indvars.iv.next119, %for.cond.loopexit.for.cond1.preheader_crit_edge ]
  %9 = mul nuw nsw i64 %indvars.iv126, 1201
  %10 = add nuw nsw i64 %9, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %10
  %scevgep109 = bitcast double* %scevgep to i8*
  %11 = sub i64 %1, %indvars.iv126
  %12 = shl i64 %11, 3
  %13 = and i64 %12, 34359738360
  %14 = add nuw nsw i64 %13, 8
  br i1 %6, label %for.body3.lr.ph, label %for.end.thread

for.end.thread:                                   ; preds = %for.cond1.preheader
  %arrayidx13137 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv126, i64 %indvars.iv126
  store double 0.000000e+00, double* %arrayidx13137, align 8
  br label %for.end31

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br i1 %lcmp.mod, label %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge, label %for.body3.lr.ph.for.body3.prol_crit_edge

for.body3.lr.ph.for.body3.prol_crit_edge:         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.lr.ph.for.body3.prol.loopexit_crit_edge: ; preds = %for.body3.lr.ph
  br label %for.body3.prol.loopexit

for.body3.prol:                                   ; preds = %for.body3.lr.ph.for.body3.prol_crit_edge, %for.body3.prol.for.body3.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.prol.for.body3.prol_crit_edge ], [ 0, %for.body3.lr.ph.for.body3.prol_crit_edge ]
  %nrm.057.prol = phi double [ %add.prol, %for.body3.prol.for.body3.prol_crit_edge ], [ 0.000000e+00, %for.body3.lr.ph.for.body3.prol_crit_edge ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.prol.for.body3.prol_crit_edge ], [ %xtraiter, %for.body3.lr.ph.for.body3.prol_crit_edge ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.prol, i64 %indvars.iv126
  %15 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %15, %15
  %add.prol = fadd double %nrm.057.prol, %mul.prol
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.prol.for.body3.prol.loopexit_crit_edge, label %for.body3.prol.for.body3.prol_crit_edge, !llvm.loop !3

for.body3.prol.for.body3.prol.loopexit_crit_edge: ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.for.body3.prol_crit_edge:          ; preds = %for.body3.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.body3.prol

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.for.body3.prol.loopexit_crit_edge, %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge ], [ %xtraiter, %for.body3.prol.for.body3.prol.loopexit_crit_edge ]
  %nrm.057.unr = phi double [ 0.000000e+00, %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge ], [ %add.prol, %for.body3.prol.for.body3.prol.loopexit_crit_edge ]
  %add.lcssa.unr = phi double [ undef, %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge ], [ %add.prol, %for.body3.prol.for.body3.prol.loopexit_crit_edge ]
  br i1 %7, label %for.body3.prol.loopexit.for.end_crit_edge, label %for.body3.prol.loopexit.for.body3_crit_edge

for.body3.prol.loopexit.for.body3_crit_edge:      ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3.prol.loopexit.for.end_crit_edge:        ; preds = %for.body3.prol.loopexit
  br label %for.end

for.body3:                                        ; preds = %for.body3.for.body3_crit_edge, %for.body3.prol.loopexit.for.body3_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body3.prol.loopexit.for.body3_crit_edge ], [ %indvars.iv.next.3, %for.body3.for.body3_crit_edge ]
  %nrm.057 = phi double [ %nrm.057.unr, %for.body3.prol.loopexit.for.body3_crit_edge ], [ %add.3, %for.body3.for.body3_crit_edge ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv126
  %16 = load double, double* %arrayidx5, align 8
  %mul = fmul double %16, %16
  %add = fadd double %nrm.057, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv126
  %17 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %17, %17
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv126
  %18 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %18, %18
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv126
  %19 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %19, %19
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %3
  br i1 %exitcond.3, label %for.body3.for.end_crit_edge, label %for.body3.for.body3_crit_edge

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  br label %for.body3

for.body3.for.end_crit_edge:                      ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.body3.for.end_crit_edge, %for.body3.prol.loopexit.for.end_crit_edge
  %nrm.0.lcssa = phi double [ %add.lcssa.unr, %for.body3.prol.loopexit.for.end_crit_edge ], [ %add.3, %for.body3.for.end_crit_edge ]
  %call = tail call double @sqrt(double %nrm.0.lcssa) #3
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv126, i64 %indvars.iv126
  store double %call, double* %arrayidx13, align 8
  br i1 %lcmp.mod131, label %for.end.for.body16.prol.loopexit.unr-lcssa_crit_edge, label %for.body16.prol.preheader

for.end.for.body16.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.end
  br label %for.body16.prol.loopexit.unr-lcssa

for.body16.prol.preheader:                        ; preds = %for.end
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv126
  %20 = load double, double* %arrayidx20.prol, align 8
  %div.prol = fdiv double %20, %call
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv126
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.body16.prol.loopexit.unr-lcssa

for.body16.prol.loopexit.unr-lcssa:               ; preds = %for.end.for.body16.prol.loopexit.unr-lcssa_crit_edge, %for.body16.prol.preheader
  %indvars.iv99.unr.ph = phi i64 [ 1, %for.body16.prol.preheader ], [ 0, %for.end.for.body16.prol.loopexit.unr-lcssa_crit_edge ]
  br i1 %8, label %for.body16.prol.loopexit.unr-lcssa.for.end31_crit_edge, label %for.body16.prol.loopexit.unr-lcssa.for.body16_crit_edge

for.body16.prol.loopexit.unr-lcssa.for.body16_crit_edge: ; preds = %for.body16.prol.loopexit.unr-lcssa
  br label %for.body16

for.body16.prol.loopexit.unr-lcssa.for.end31_crit_edge: ; preds = %for.body16.prol.loopexit.unr-lcssa
  br label %for.end31

for.body16:                                       ; preds = %for.body16.for.body16_crit_edge, %for.body16.prol.loopexit.unr-lcssa.for.body16_crit_edge
  %indvars.iv99 = phi i64 [ %indvars.iv99.unr.ph, %for.body16.prol.loopexit.unr-lcssa.for.body16_crit_edge ], [ %indvars.iv.next100.1, %for.body16.for.body16_crit_edge ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv126
  %21 = load double, double* %arrayidx20, align 8
  %22 = load double, double* %arrayidx13, align 8
  %div = fdiv double %21, %22
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv99, i64 %indvars.iv126
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next100, i64 %indvars.iv126
  %23 = load double, double* %arrayidx20.1, align 8
  %24 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %23, %24
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next100, i64 %indvars.iv126
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next100.1 = add nuw nsw i64 %indvars.iv99, 2
  %exitcond102.1 = icmp eq i64 %indvars.iv.next100.1, %3
  br i1 %exitcond102.1, label %for.body16.for.end31_crit_edge, label %for.body16.for.body16_crit_edge

for.body16.for.body16_crit_edge:                  ; preds = %for.body16
  br label %for.body16

for.body16.for.end31_crit_edge:                   ; preds = %for.body16
  br label %for.end31

for.end31:                                        ; preds = %for.body16.for.end31_crit_edge, %for.body16.prol.loopexit.unr-lcssa.for.end31_crit_edge, %for.end.thread
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %cmp3464 = icmp slt i64 %indvars.iv.next127, %2
  br i1 %cmp3464, label %for.body35.lr.ph, label %for.end31.for.cond.loopexit_crit_edge

for.end31.for.cond.loopexit_crit_edge:            ; preds = %for.end31
  br label %for.cond.loopexit

for.body35.lr.ph:                                 ; preds = %for.end31
  br i1 %6, label %for.body42.lr.ph.us.preheader, label %for.body35.preheader

for.body42.lr.ph.us.preheader:                    ; preds = %for.body35.lr.ph
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv126
  br label %for.body42.lr.ph.us

for.body35.preheader:                             ; preds = %for.body35.lr.ph
  call void @llvm.memset.p0i8.i64(i8* %scevgep109, i8 0, i64 %14, i32 8, i1 false)
  br label %for.cond.loopexit

for.body42.lr.ph.us:                              ; preds = %for.inc83.us.for.body42.lr.ph.us_crit_edge, %for.body42.lr.ph.us.preheader
  %indvars.iv120 = phi i64 [ %indvars.iv118, %for.body42.lr.ph.us.preheader ], [ %indvars.iv.next121, %for.inc83.us.for.body42.lr.ph.us_crit_edge ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv126, i64 %indvars.iv120
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 %lcmp.mod133, label %for.body42.us.prol.preheader, label %for.body42.lr.ph.us.for.body42.us.prol.loopexit.unr-lcssa_crit_edge

for.body42.lr.ph.us.for.body42.us.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.body42.lr.ph.us
  br label %for.body42.us.prol.loopexit.unr-lcssa

for.body42.us.prol.preheader:                     ; preds = %for.body42.lr.ph.us
  %25 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv120
  %26 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %25, %26
  %add56.us.prol = fadd double %mul51.us.prol, 0.000000e+00
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.body42.us.prol.loopexit.unr-lcssa

for.body42.us.prol.loopexit.unr-lcssa:            ; preds = %for.body42.lr.ph.us.for.body42.us.prol.loopexit.unr-lcssa_crit_edge, %for.body42.us.prol.preheader
  %27 = phi double [ %add56.us.prol, %for.body42.us.prol.preheader ], [ 0.000000e+00, %for.body42.lr.ph.us.for.body42.us.prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv110.unr.ph = phi i64 [ 1, %for.body42.us.prol.preheader ], [ 0, %for.body42.lr.ph.us.for.body42.us.prol.loopexit.unr-lcssa_crit_edge ]
  br i1 %8, label %for.body42.us.prol.loopexit.unr-lcssa.for.body62.us.preheader_crit_edge, label %for.body42.us.prol.loopexit.unr-lcssa.for.body42.us_crit_edge

for.body42.us.prol.loopexit.unr-lcssa.for.body42.us_crit_edge: ; preds = %for.body42.us.prol.loopexit.unr-lcssa
  br label %for.body42.us

for.body42.us.prol.loopexit.unr-lcssa.for.body62.us.preheader_crit_edge: ; preds = %for.body42.us.prol.loopexit.unr-lcssa
  br label %for.body62.us.preheader

for.body42.us:                                    ; preds = %for.body42.us.for.body42.us_crit_edge, %for.body42.us.prol.loopexit.unr-lcssa.for.body42.us_crit_edge
  %28 = phi double [ %27, %for.body42.us.prol.loopexit.unr-lcssa.for.body42.us_crit_edge ], [ %add56.us.1, %for.body42.us.for.body42.us_crit_edge ]
  %indvars.iv110 = phi i64 [ %indvars.iv110.unr.ph, %for.body42.us.prol.loopexit.unr-lcssa.for.body42.us_crit_edge ], [ %indvars.iv.next111.1, %for.body42.us.for.body42.us_crit_edge ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv110, i64 %indvars.iv126
  %29 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv120
  %30 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %29, %30
  %add56.us = fadd double %28, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next111, i64 %indvars.iv126
  %31 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next111, i64 %indvars.iv120
  %32 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %31, %32
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next111.1 = add nuw nsw i64 %indvars.iv110, 2
  %exitcond113.1 = icmp eq i64 %indvars.iv.next111.1, %3
  br i1 %exitcond113.1, label %for.body42.us.for.body62.us.preheader_crit_edge, label %for.body42.us.for.body42.us_crit_edge

for.body42.us.for.body42.us_crit_edge:            ; preds = %for.body42.us
  br label %for.body42.us

for.body42.us.for.body62.us.preheader_crit_edge:  ; preds = %for.body42.us
  br label %for.body62.us.preheader

for.body62.us.preheader:                          ; preds = %for.body42.us.for.body62.us.preheader_crit_edge, %for.body42.us.prol.loopexit.unr-lcssa.for.body62.us.preheader_crit_edge
  %33 = phi double [ %27, %for.body42.us.prol.loopexit.unr-lcssa.for.body62.us.preheader_crit_edge ], [ %add56.us.1, %for.body42.us.for.body62.us.preheader_crit_edge ]
  br i1 %lcmp.mod133, label %for.body62.us.prol.preheader, label %for.body62.us.preheader.for.body62.us.prol.loopexit.unr-lcssa_crit_edge

for.body62.us.preheader.for.body62.us.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.body62.us.preheader
  br label %for.body62.us.prol.loopexit.unr-lcssa

for.body62.us.prol.preheader:                     ; preds = %for.body62.us.preheader
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv120
  %34 = load double, double* %arrayidx66.us.prol, align 8
  %35 = load double, double* %arrayidx46.us.prol, align 8
  %mul75.us.prol = fmul double %35, %33
  %sub.us.prol = fsub double %34, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.body62.us.prol.loopexit.unr-lcssa

for.body62.us.prol.loopexit.unr-lcssa:            ; preds = %for.body62.us.preheader.for.body62.us.prol.loopexit.unr-lcssa_crit_edge, %for.body62.us.prol.preheader
  %indvars.iv114.unr.ph = phi i64 [ 1, %for.body62.us.prol.preheader ], [ 0, %for.body62.us.preheader.for.body62.us.prol.loopexit.unr-lcssa_crit_edge ]
  br i1 %8, label %for.body62.us.prol.loopexit.unr-lcssa.for.inc83.us_crit_edge, label %for.body62.us.prol.loopexit.unr-lcssa.for.body62.us_crit_edge

for.body62.us.prol.loopexit.unr-lcssa.for.body62.us_crit_edge: ; preds = %for.body62.us.prol.loopexit.unr-lcssa
  br label %for.body62.us

for.body62.us.prol.loopexit.unr-lcssa.for.inc83.us_crit_edge: ; preds = %for.body62.us.prol.loopexit.unr-lcssa
  br label %for.inc83.us

for.body62.us:                                    ; preds = %for.body62.us.for.body62.us_crit_edge, %for.body62.us.prol.loopexit.unr-lcssa.for.body62.us_crit_edge
  %indvars.iv114 = phi i64 [ %indvars.iv114.unr.ph, %for.body62.us.prol.loopexit.unr-lcssa.for.body62.us_crit_edge ], [ %indvars.iv.next115.1, %for.body62.us.for.body62.us_crit_edge ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv114, i64 %indvars.iv120
  %36 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv114, i64 %indvars.iv126
  %37 = load double, double* %arrayidx70.us, align 8
  %38 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %37, %38
  %sub.us = fsub double %36, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next115, i64 %indvars.iv120
  %39 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next115, i64 %indvars.iv126
  %40 = load double, double* %arrayidx70.us.1, align 8
  %41 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %40, %41
  %sub.us.1 = fsub double %39, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next115.1 = add nuw nsw i64 %indvars.iv114, 2
  %exitcond117.1 = icmp eq i64 %indvars.iv.next115.1, %3
  br i1 %exitcond117.1, label %for.body62.us.for.inc83.us_crit_edge, label %for.body62.us.for.body62.us_crit_edge

for.body62.us.for.body62.us_crit_edge:            ; preds = %for.body62.us
  br label %for.body62.us

for.body62.us.for.inc83.us_crit_edge:             ; preds = %for.body62.us
  br label %for.inc83.us

for.inc83.us:                                     ; preds = %for.body62.us.for.inc83.us_crit_edge, %for.body62.us.prol.loopexit.unr-lcssa.for.inc83.us_crit_edge
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond = icmp eq i64 %indvars.iv.next121, %5
  br i1 %exitcond, label %for.inc83.us.for.cond.loopexit_crit_edge, label %for.inc83.us.for.body42.lr.ph.us_crit_edge

for.inc83.us.for.body42.lr.ph.us_crit_edge:       ; preds = %for.inc83.us
  br label %for.body42.lr.ph.us

for.inc83.us.for.cond.loopexit_crit_edge:         ; preds = %for.inc83.us
  br label %for.cond.loopexit

for.end88:                                        ; preds = %for.cond.loopexit.for.end88_crit_edge, %entry.for.end88_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.body4.lr.ph.us.preheader, label %entry.for.end12_crit_edge

entry.for.end12_crit_edge:                        ; preds = %entry
  br label %for.end12

for.body4.lr.ph.us.preheader:                     ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  br label %for.body4.lr.ph.us

for.body4.lr.ph.us:                               ; preds = %for.inc10.us.for.body4.lr.ph.us_crit_edge, %for.body4.lr.ph.us.preheader
  %indvars.iv24 = phi i64 [ 0, %for.body4.lr.ph.us.preheader ], [ %indvars.iv.next25, %for.inc10.us.for.body4.lr.ph.us_crit_edge ]
  %5 = mul nsw i64 %indvars.iv24, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us.for.body4.us_crit_edge, %for.body4.lr.ph.us
  %indvars.iv19 = phi i64 [ 0, %for.body4.lr.ph.us ], [ %indvars.iv.next20, %if.end.us.for.body4.us_crit_edge ]
  %6 = add nsw i64 %indvars.iv19, %5
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.if.end.us_crit_edge

for.body4.us.if.end.us_crit_edge:                 ; preds = %for.body4.us
  br label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc19.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us.if.end.us_crit_edge, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv24, i64 %indvars.iv19
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next20, %4
  br i1 %exitcond30, label %for.inc10.us, label %if.end.us.for.body4.us_crit_edge

if.end.us.for.body4.us_crit_edge:                 ; preds = %if.end.us
  br label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next25, %4
  br i1 %exitcond28, label %for.inc10.us.for.end12_crit_edge, label %for.inc10.us.for.body4.lr.ph.us_crit_edge

for.inc10.us.for.body4.lr.ph.us_crit_edge:        ; preds = %for.inc10.us
  br label %for.body4.lr.ph.us

for.inc10.us.for.end12_crit_edge:                 ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.inc10.us.for.end12_crit_edge, %entry.for.end12_crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %cmp163.not = icmp slt i32 %m, 1
  %cmp8.not = xor i1 %cmp8, true
  %brmerge = or i1 %cmp163.not, %cmp8.not
  br i1 %brmerge, label %for.end12.for.end38_crit_edge, label %for.body20.lr.ph.us.preheader

for.end12.for.end38_crit_edge:                    ; preds = %for.end12
  br label %for.end38

for.body20.lr.ph.us.preheader:                    ; preds = %for.end12
  %13 = sext i32 %n to i64
  %14 = zext i32 %n to i64
  %15 = zext i32 %m to i64
  br label %for.body20.lr.ph.us

for.body20.lr.ph.us:                              ; preds = %for.inc36.us.for.body20.lr.ph.us_crit_edge, %for.body20.lr.ph.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.body20.lr.ph.us.preheader ], [ %indvars.iv.next14, %for.inc36.us.for.body20.lr.ph.us_crit_edge ]
  %16 = mul nsw i64 %indvars.iv13, %13
  br label %for.body20.us

for.body20.us:                                    ; preds = %if.end27.us.for.body20.us_crit_edge, %for.body20.lr.ph.us
  %indvars.iv = phi i64 [ 0, %for.body20.lr.ph.us ], [ %indvars.iv.next, %if.end27.us.for.body20.us_crit_edge ]
  %17 = add nsw i64 %indvars.iv, %16
  %18 = trunc i64 %17 to i32
  %rem23.us = srem i32 %18, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %for.body20.us.if.end27.us_crit_edge

for.body20.us.if.end27.us_crit_edge:              ; preds = %for.body20.us
  br label %if.end27.us

if.then25.us:                                     ; preds = %for.body20.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #5
  br label %if.end27.us

if.end27.us:                                      ; preds = %for.body20.us.if.end27.us_crit_edge, %if.then25.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv13, i64 %indvars.iv
  %21 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next, %14
  br i1 %exitcond29, label %for.inc36.us, label %if.end27.us.for.body20.us_crit_edge

if.end27.us.for.body20.us_crit_edge:              ; preds = %if.end27.us
  br label %for.body20.us

for.inc36.us:                                     ; preds = %if.end27.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, %15
  br i1 %exitcond, label %for.inc36.us.for.end38_crit_edge, label %for.inc36.us.for.body20.lr.ph.us_crit_edge

for.inc36.us.for.body20.lr.ph.us_crit_edge:       ; preds = %for.inc36.us
  br label %for.body20.lr.ph.us

for.inc36.us.for.end38_crit_edge:                 ; preds = %for.inc36.us
  br label %for.end38

for.end38:                                        ; preds = %for.inc36.us.for.end38_crit_edge, %for.end12.for.end38_crit_edge
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
