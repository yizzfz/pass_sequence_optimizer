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
  %arraydecay1 = bitcast i8* %call to [1200 x double]*
  %arraydecay32 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay43 = bitcast i8* %call2 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %arraydecay1, [1200 x double]* %arraydecay32, [1200 x double]* %arraydecay43)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %arraydecay1, [1200 x double]* %arraydecay32, [1200 x double]* %arraydecay43)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay32, [1200 x double]* %arraydecay43)
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
  %0 = zext i32 %n to i64
  %1 = zext i32 %m to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc12_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv20 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next21, %for.cond1.for.inc12_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv15 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next16, %for.body3.us ]
  %2 = mul nuw nsw i64 %indvars.iv15, %indvars.iv20
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv15
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv20, i64 %indvars.iv15
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %0
  br i1 %exitcond, label %for.cond1.for.inc12_crit_edge.us, label %for.body3.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next21, %1
  br i1 %exitcond29, label %for.cond15.preheader.loopexit, label %for.cond1.preheader.us

for.cond15.preheader.loopexit:                    ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  %cmp163 = icmp sgt i32 %n, 0
  br i1 %cmp163, label %for.cond19.preheader.us.preheader, label %for.end32

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
  %indvars.iv11.prol = phi i64 [ %indvars.iv.next12.prol, %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge ], [ 0, %for.cond19.for.inc30_crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge ], [ %xtraiter, %for.cond19.for.inc30_crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv11.prol, i64 0
  %scevgep25.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.prol, i8 0, i64 %5, i32 8, i1 false)
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond19.preheader.us.prol.loopexit.loopexit, label %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge, !llvm.loop !1

for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge: ; preds = %for.cond19.for.inc30_crit_edge.us.prol
  %indvars.iv.next12.prol = add nuw nsw i64 %indvars.iv11.prol, 1
  br label %for.cond19.for.inc30_crit_edge.us.prol

for.cond19.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond19.for.inc30_crit_edge.us.prol
  br label %for.cond19.preheader.us.prol.loopexit

for.cond19.preheader.us.prol.loopexit:            ; preds = %for.cond19.preheader.us.prol.loopexit.loopexit, %for.cond19.preheader.us.preheader
  %indvars.iv11.unr = phi i64 [ 0, %for.cond19.preheader.us.preheader ], [ %xtraiter, %for.cond19.preheader.us.prol.loopexit.loopexit ]
  %7 = icmp ult i64 %6, 3
  br i1 %7, label %for.end32, label %for.cond19.for.inc30_crit_edge.us.3.preheader

for.cond19.for.inc30_crit_edge.us.3.preheader:    ; preds = %for.cond19.preheader.us.prol.loopexit
  %8 = add nsw i64 %4, -4
  %9 = sub nsw i64 %8, %indvars.iv11.unr
  %10 = lshr i64 %9, 2
  %11 = and i64 %10, 1
  %lcmp.mod31 = icmp eq i64 %11, 0
  br i1 %lcmp.mod31, label %for.cond19.for.inc30_crit_edge.us.3.prol.preheader, label %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit

for.cond19.for.inc30_crit_edge.us.3.prol.preheader: ; preds = %for.cond19.for.inc30_crit_edge.us.3.preheader
  br label %for.cond19.for.inc30_crit_edge.us.3.prol

for.cond19.for.inc30_crit_edge.us.3.prol:         ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.preheader
  %scevgep.prol33 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv11.unr, i64 0
  %scevgep25.prol34 = bitcast double* %scevgep.prol33 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.prol34, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.prol35 = add nuw nsw i64 %indvars.iv11.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.prol35, i64 0
  %scevgep25.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.1.prol = add nuw nsw i64 %indvars.iv11.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.1.prol, i64 0
  %scevgep25.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.2.prol = add nuw nsw i64 %indvars.iv11.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.2.prol, i64 0
  %scevgep25.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.3.prol = or i64 %indvars.iv11.unr, 4
  br label %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit

for.cond19.for.inc30_crit_edge.us.3.prol.loopexit: ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol, %for.cond19.for.inc30_crit_edge.us.3.preheader
  %indvars.iv11.unr36 = phi i64 [ %indvars.iv11.unr, %for.cond19.for.inc30_crit_edge.us.3.preheader ], [ %indvars.iv.next12.3.prol, %for.cond19.for.inc30_crit_edge.us.3.prol ]
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
  %indvars.iv11 = phi i64 [ %indvars.iv11.unr36, %for.cond19.for.inc30_crit_edge.us.3.preheader.new ], [ %indvars.iv.next12.3.1, %for.cond19.for.inc30_crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv11, i64 0
  %scevgep25 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12, i64 0
  %scevgep25.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv11, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.1, i64 0
  %scevgep25.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.2 = add nsw i64 %indvars.iv11, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.2, i64 0
  %scevgep25.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.3 = add nsw i64 %indvars.iv11, 4
  %scevgep.137 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.3, i64 0
  %scevgep25.138 = bitcast double* %scevgep.137 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.138, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.139 = add nsw i64 %indvars.iv11, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.139, i64 0
  %scevgep25.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.1.1 = add nsw i64 %indvars.iv11, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.1.1, i64 0
  %scevgep25.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.2.1 = add nsw i64 %indvars.iv11, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.2.1, i64 0
  %scevgep25.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.3.1 = add nsw i64 %indvars.iv11, 8
  %exitcond14.3.1 = icmp eq i64 %indvars.iv.next12.3.1, %4
  br i1 %exitcond14.3.1, label %for.end32.loopexit.unr-lcssa, label %for.cond19.for.inc30_crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  %cmp60 = icmp sgt i32 %n, 0
  br i1 %cmp60, label %for.cond1.preheader.lr.ph, label %for.end88

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = sext i32 %n to i64
  %1 = zext i32 %m to i64
  %2 = add nsw i64 %1, -1
  %3 = zext i32 %n to i64
  %4 = shl nuw nsw i64 %3, 3
  %5 = add nsw i64 %4, -8
  %6 = icmp sgt i32 %m, 0
  %xtraiter = and i64 %1, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %7 = icmp ult i64 %2, 3
  %xtraiter103 = and i64 %1, 1
  %lcmp.mod104 = icmp eq i64 %xtraiter103, 0
  %8 = icmp eq i64 %2, 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc86.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv99 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next100, %for.inc86.for.cond1.preheader_crit_edge ]
  %indvars.iv93 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next94, %for.inc86.for.cond1.preheader_crit_edge ]
  %9 = mul i64 %indvars.iv99, 1201
  %10 = add i64 %9, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %10
  %scevgep105 = bitcast double* %scevgep to i8*
  %11 = mul i64 %indvars.iv99, -8
  %12 = add i64 %5, %11
  br i1 %6, label %for.body3.lr.ph, label %for.end

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br i1 %lcmp.mod, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol.for.body3.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.prol.for.body3.prol_crit_edge ], [ 0, %for.body3.prol.preheader ]
  %nrm.014.prol = phi double [ %add.prol, %for.body3.prol.for.body3.prol_crit_edge ], [ 0.000000e+00, %for.body3.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.prol.for.body3.prol_crit_edge ], [ %xtraiter, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.prol, i64 %indvars.iv99
  %13 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %13, %13
  %add.prol = fadd double %nrm.014.prol, %mul.prol
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol.for.body3.prol_crit_edge, !llvm.loop !3

for.body3.prol.for.body3.prol_crit_edge:          ; preds = %for.body3.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.body3.prol

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph ], [ %xtraiter, %for.body3.prol.loopexit.loopexit ]
  %nrm.014.unr = phi double [ 0.000000e+00, %for.body3.lr.ph ], [ %add.prol, %for.body3.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.body3.lr.ph ], [ %add.prol, %for.body3.prol.loopexit.loopexit ]
  br i1 %7, label %for.end, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3 ], [ %indvars.iv.unr, %for.body3.preheader ]
  %nrm.014 = phi double [ %add.3, %for.body3 ], [ %nrm.014.unr, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv99
  %14 = load double, double* %arrayidx5, align 8
  %mul = fmul double %14, %14
  %add = fadd double %nrm.014, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv99
  %15 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %15, %15
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv99
  %16 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %16, %16
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv99
  %17 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %17, %17
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %1
  br i1 %exitcond.3, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3.prol.loopexit, %for.cond1.preheader
  %nrm.0.lcssa = phi double [ 0.000000e+00, %for.cond1.preheader ], [ %add.lcssa.unr, %for.body3.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %nrm.0.lcssa) #4
  %arrayidx11 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv99
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv99, i64 %indvars.iv99
  store double %call, double* %arrayidx13, align 8
  br i1 %6, label %for.body16.lr.ph, label %for.cond33.preheader

for.body16.lr.ph:                                 ; preds = %for.end
  br i1 %lcmp.mod104, label %for.body16.prol.loopexit, label %for.body16.prol

for.body16.prol:                                  ; preds = %for.body16.lr.ph
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv99
  %18 = load double, double* %arrayidx20.prol, align 8
  %sunkaddr70.prol = ptrtoint [1200 x double]* %arrayidx11 to i64
  %sunkaddr71.prol = shl nsw i64 %indvars.iv99, 3
  %sunkaddr72.prol = add i64 %sunkaddr70.prol, %sunkaddr71.prol
  %sunkaddr73.prol = inttoptr i64 %sunkaddr72.prol to double*
  %19 = load double, double* %sunkaddr73.prol, align 8
  %div.prol = fdiv double %18, %19
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv99
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.body16.prol.loopexit

for.body16.prol.loopexit:                         ; preds = %for.body16.lr.ph, %for.body16.prol
  %indvars.iv75.unr.ph = phi i64 [ 1, %for.body16.prol ], [ 0, %for.body16.lr.ph ]
  br i1 %8, label %for.cond33.preheader, label %for.body16.preheader

for.body16.preheader:                             ; preds = %for.body16.prol.loopexit
  %sunkaddr70 = ptrtoint [1200 x double]* %arrayidx11 to i64
  %sunkaddr71 = shl nsw i64 %indvars.iv99, 3
  %sunkaddr72 = add i64 %sunkaddr70, %sunkaddr71
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to double*
  br label %for.body16

for.cond33.preheader.loopexit:                    ; preds = %for.body16
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.cond33.preheader.loopexit, %for.body16.prol.loopexit, %for.end
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %cmp3422 = icmp slt i64 %indvars.iv.next100, %0
  br i1 %cmp3422, label %for.body35.lr.ph, label %for.inc86

for.body35.lr.ph:                                 ; preds = %for.cond33.preheader
  br i1 %6, label %for.body35.us.preheader, label %for.inc86.loopexit74

for.body35.us.preheader:                          ; preds = %for.body35.lr.ph
  %sunkaddr62 = ptrtoint [1200 x double]* %arrayidx11 to i64
  %arrayidx70.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv99
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.cond33.loopexit.us, %for.body35.us.preheader
  %indvars.iv95 = phi i64 [ %indvars.iv93, %for.body35.us.preheader ], [ %indvars.iv.next96, %for.cond33.loopexit.us ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv99, i64 %indvars.iv95
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 %lcmp.mod104, label %for.body42.us.prol.loopexit, label %for.body42.us.prol

for.body42.us.prol:                               ; preds = %for.body35.us
  %20 = load double, double* %arrayidx70.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv95
  %21 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %20, %21
  %sunkaddr67.prol = shl nsw i64 %indvars.iv95, 3
  %sunkaddr68.prol = add i64 %sunkaddr62, %sunkaddr67.prol
  %sunkaddr69.prol = inttoptr i64 %sunkaddr68.prol to double*
  %22 = load double, double* %sunkaddr69.prol, align 8
  %add56.us.prol = fadd double %22, %mul51.us.prol
  store double %add56.us.prol, double* %sunkaddr69.prol, align 8
  br label %for.body42.us.prol.loopexit

for.body42.us.prol.loopexit:                      ; preds = %for.body35.us, %for.body42.us.prol
  %indvars.iv85.unr.ph = phi i64 [ 1, %for.body42.us.prol ], [ 0, %for.body35.us ]
  br i1 %8, label %for.body62.lr.ph.us, label %for.body42.us.preheader

for.body42.us.preheader:                          ; preds = %for.body42.us.prol.loopexit
  %sunkaddr67 = shl nsw i64 %indvars.iv95, 3
  %sunkaddr68 = add i64 %sunkaddr62, %sunkaddr67
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to double*
  %.pre = load double, double* %sunkaddr69, align 8
  br label %for.body42.us

for.body62.us:                                    ; preds = %for.body62.us, %for.body62.us.preheader
  %indvars.iv89 = phi i64 [ %indvars.iv89.unr.ph, %for.body62.us.preheader ], [ %indvars.iv.next90.1, %for.body62.us ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv95
  %23 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv89, i64 %indvars.iv99
  %24 = load double, double* %arrayidx70.us, align 8
  %25 = load double, double* %sunkaddr65, align 8
  %mul75.us = fmul double %24, %25
  %sub.us = fsub double %23, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next90, i64 %indvars.iv95
  %26 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next90, i64 %indvars.iv99
  %27 = load double, double* %arrayidx70.us.1, align 8
  %28 = load double, double* %sunkaddr65, align 8
  %mul75.us.1 = fmul double %27, %28
  %sub.us.1 = fsub double %26, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next90.1 = add nuw nsw i64 %indvars.iv89, 2
  %exitcond92.1 = icmp eq i64 %indvars.iv.next90.1, %1
  br i1 %exitcond92.1, label %for.cond33.loopexit.us.loopexit, label %for.body62.us

for.body42.us:                                    ; preds = %for.body42.us, %for.body42.us.preheader
  %29 = phi double [ %.pre, %for.body42.us.preheader ], [ %add56.us.1, %for.body42.us ]
  %indvars.iv85 = phi i64 [ %indvars.iv85.unr.ph, %for.body42.us.preheader ], [ %indvars.iv.next86.1, %for.body42.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv85, i64 %indvars.iv99
  %30 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv95
  %31 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %30, %31
  %add56.us = fadd double %29, %mul51.us
  store double %add56.us, double* %sunkaddr69, align 8
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next86, i64 %indvars.iv99
  %32 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next86, i64 %indvars.iv95
  %33 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %32, %33
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %sunkaddr69, align 8
  %indvars.iv.next86.1 = add nuw nsw i64 %indvars.iv85, 2
  %exitcond88.1 = icmp eq i64 %indvars.iv.next86.1, %1
  br i1 %exitcond88.1, label %for.body62.lr.ph.us.loopexit, label %for.body42.us

for.cond33.loopexit.us.loopexit:                  ; preds = %for.body62.us
  br label %for.cond33.loopexit.us

for.cond33.loopexit.us:                           ; preds = %for.cond33.loopexit.us.loopexit, %for.body62.us.prol.loopexit
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond = icmp eq i64 %indvars.iv.next96, %3
  br i1 %exitcond, label %for.inc86.loopexit, label %for.body35.us

for.body62.lr.ph.us.loopexit:                     ; preds = %for.body42.us
  br label %for.body62.lr.ph.us

for.body62.lr.ph.us:                              ; preds = %for.body62.lr.ph.us.loopexit, %for.body42.us.prol.loopexit
  br i1 %lcmp.mod104, label %for.body62.us.prol.loopexit, label %for.body62.us.prol

for.body62.us.prol:                               ; preds = %for.body62.lr.ph.us
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv95
  %34 = load double, double* %arrayidx66.us.prol, align 8
  %35 = load double, double* %arrayidx70.us.prol, align 8
  %sunkaddr63.prol = shl nsw i64 %indvars.iv95, 3
  %sunkaddr64.prol = add i64 %sunkaddr62, %sunkaddr63.prol
  %sunkaddr65.prol = inttoptr i64 %sunkaddr64.prol to double*
  %36 = load double, double* %sunkaddr65.prol, align 8
  %mul75.us.prol = fmul double %35, %36
  %sub.us.prol = fsub double %34, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.body62.us.prol.loopexit

for.body62.us.prol.loopexit:                      ; preds = %for.body62.lr.ph.us, %for.body62.us.prol
  %indvars.iv89.unr.ph = phi i64 [ 1, %for.body62.us.prol ], [ 0, %for.body62.lr.ph.us ]
  br i1 %8, label %for.cond33.loopexit.us, label %for.body62.us.preheader

for.body62.us.preheader:                          ; preds = %for.body62.us.prol.loopexit
  %sunkaddr63 = shl nsw i64 %indvars.iv95, 3
  %sunkaddr64 = add i64 %sunkaddr62, %sunkaddr63
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to double*
  br label %for.body62.us

for.body16:                                       ; preds = %for.body16, %for.body16.preheader
  %indvars.iv75 = phi i64 [ %indvars.iv75.unr.ph, %for.body16.preheader ], [ %indvars.iv.next76.1, %for.body16 ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv99
  %37 = load double, double* %arrayidx20, align 8
  %38 = load double, double* %sunkaddr73, align 8
  %div = fdiv double %37, %38
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv75, i64 %indvars.iv99
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next76, i64 %indvars.iv99
  %39 = load double, double* %arrayidx20.1, align 8
  %40 = load double, double* %sunkaddr73, align 8
  %div.1 = fdiv double %39, %40
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next76, i64 %indvars.iv99
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next76.1 = add nuw nsw i64 %indvars.iv75, 2
  %exitcond78.1 = icmp eq i64 %indvars.iv.next76.1, %1
  br i1 %exitcond78.1, label %for.cond33.preheader.loopexit, label %for.body16

for.inc86.loopexit74:                             ; preds = %for.body35.lr.ph
  call void @llvm.memset.p0i8.i64(i8* %scevgep105, i8 0, i64 %12, i32 8, i1 false)
  br label %for.inc86

for.inc86.loopexit:                               ; preds = %for.cond33.loopexit.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit, %for.cond33.preheader, %for.inc86.loopexit74
  %exitcond112 = icmp eq i64 %indvars.iv.next100, %3
  br i1 %exitcond112, label %for.end88.loopexit, label %for.inc86.for.cond1.preheader_crit_edge

for.inc86.for.cond1.preheader_crit_edge:          ; preds = %for.inc86
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next15, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv14, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv9 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next10, %if.end.us ]
  %6 = add nsw i64 %indvars.iv9, %5
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv14, i64 %indvars.iv9
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next10, %4
  br i1 %exitcond20, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next15, %4
  br i1 %exitcond21, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %cmp166 = icmp sgt i32 %m, 0
  %or.cond = and i1 %cmp166, %cmp10
  br i1 %or.cond, label %for.cond18.preheader.us.preheader, label %for.end38

for.cond18.preheader.us.preheader:                ; preds = %for.end12
  %13 = sext i32 %n to i64
  %14 = zext i32 %n to i64
  %15 = zext i32 %m to i64
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.for.inc36_crit_edge.us, %for.cond18.preheader.us.preheader
  %indvars.iv3 = phi i64 [ 0, %for.cond18.preheader.us.preheader ], [ %indvars.iv.next4, %for.cond18.for.inc36_crit_edge.us ]
  %16 = mul nsw i64 %indvars.iv3, %13
  br label %for.body20.us

for.body20.us:                                    ; preds = %if.end27.us, %for.cond18.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next, %if.end27.us ]
  %17 = add nsw i64 %indvars.iv, %16
  %18 = trunc i64 %17 to i32
  %rem23.us = srem i32 %18, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %if.end27.us

if.then25.us:                                     ; preds = %for.body20.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #6
  br label %if.end27.us

if.end27.us:                                      ; preds = %for.body20.us, %if.then25.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv3, i64 %indvars.iv
  %21 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, %14
  br i1 %exitcond19, label %for.cond18.for.inc36_crit_edge.us, label %for.body20.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %if.end27.us
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, %15
  br i1 %exitcond, label %for.end38.loopexit, label %for.cond18.preheader.us

for.end38.loopexit:                               ; preds = %for.cond18.for.inc36_crit_edge.us
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.end12
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
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
