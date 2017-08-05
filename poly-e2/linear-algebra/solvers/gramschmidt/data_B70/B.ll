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
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  %cmp10 = icmp sgt i32 %m, 0
  br i1 %cmp10, label %for.cond1.preheader.lr.ph, label %for.cond15.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp28 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  br i1 %cmp28, label %for.body3.lr.ph.us.preheader, label %for.end32

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %0 = zext i32 %n to i64
  %1 = zext i32 %m to i64
  br label %for.body3.lr.ph.us

for.body3.lr.ph.us:                               ; preds = %for.end.us, %for.body3.lr.ph.us.preheader
  %indvars.iv26 = phi i64 [ 0, %for.body3.lr.ph.us.preheader ], [ %indvars.iv.next27, %for.end.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.lr.ph.us
  %indvars.iv19 = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next20, %for.body3.us ]
  %2 = mul nuw nsw i64 %indvars.iv19, %indvars.iv26
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv26, i64 %indvars.iv19
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv26, i64 %indvars.iv19
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond = icmp eq i64 %indvars.iv.next20, %0
  br i1 %exitcond, label %for.end.us, label %for.body3.us

for.end.us:                                       ; preds = %for.body3.us
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next27, %1
  br i1 %exitcond33, label %for.cond15.preheader.loopexit, label %for.body3.lr.ph.us

for.cond15.preheader.loopexit:                    ; preds = %for.end.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  %cmp166 = icmp sgt i32 %n, 0
  br i1 %cmp166, label %for.body22.lr.ph.us.preheader, label %for.end32

for.body22.lr.ph.us.preheader:                    ; preds = %for.cond15.preheader
  %4 = add i32 %n, -1
  %5 = zext i32 %4 to i64
  %6 = shl nuw nsw i64 %5, 3
  %7 = add nuw nsw i64 %6, 8
  %8 = zext i32 %n to i64
  %9 = add nsw i64 %8, -1
  %xtraiter = and i64 %8, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body22.lr.ph.us.prol.loopexit, label %for.body22.lr.ph.us.prol.preheader

for.body22.lr.ph.us.prol.preheader:               ; preds = %for.body22.lr.ph.us.preheader
  br label %for.body22.lr.ph.us.prol

for.body22.lr.ph.us.prol:                         ; preds = %for.body22.lr.ph.us.prol.preheader, %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge
  %indvars.iv15.prol = phi i64 [ %indvars.iv.next16.prol, %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge ], [ 0, %for.body22.lr.ph.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge ], [ %xtraiter, %for.body22.lr.ph.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv15.prol, i64 0
  %scevgep14.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.prol, i8 0, i64 %7, i32 8, i1 false)
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body22.lr.ph.us.prol.loopexit.loopexit, label %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge, !llvm.loop !1

for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge: ; preds = %for.body22.lr.ph.us.prol
  %indvars.iv.next16.prol = add nuw nsw i64 %indvars.iv15.prol, 1
  br label %for.body22.lr.ph.us.prol

for.body22.lr.ph.us.prol.loopexit.loopexit:       ; preds = %for.body22.lr.ph.us.prol
  br label %for.body22.lr.ph.us.prol.loopexit

for.body22.lr.ph.us.prol.loopexit:                ; preds = %for.body22.lr.ph.us.prol.loopexit.loopexit, %for.body22.lr.ph.us.preheader
  %indvars.iv15.unr = phi i64 [ 0, %for.body22.lr.ph.us.preheader ], [ %xtraiter, %for.body22.lr.ph.us.prol.loopexit.loopexit ]
  %10 = icmp ult i64 %9, 3
  br i1 %10, label %for.end32, label %for.body22.lr.ph.us.preheader34

for.body22.lr.ph.us.preheader34:                  ; preds = %for.body22.lr.ph.us.prol.loopexit
  %11 = add nsw i64 %8, -4
  %12 = sub nsw i64 %11, %indvars.iv15.unr
  %13 = lshr i64 %12, 2
  %14 = and i64 %13, 1
  %lcmp.mod38 = icmp eq i64 %14, 0
  br i1 %lcmp.mod38, label %for.body22.lr.ph.us.prol.preheader35, label %for.body22.lr.ph.us.prol.loopexit36

for.body22.lr.ph.us.prol.preheader35:             ; preds = %for.body22.lr.ph.us.preheader34
  br label %for.body22.lr.ph.us.prol39

for.body22.lr.ph.us.prol39:                       ; preds = %for.body22.lr.ph.us.prol.preheader35
  %scevgep.prol41 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv15.unr, i64 0
  %scevgep14.prol42 = bitcast double* %scevgep.prol41 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.prol42, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next16.prol43 = add nuw nsw i64 %indvars.iv15.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16.prol43, i64 0
  %scevgep14.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.1.prol, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next16.1.prol = add nuw nsw i64 %indvars.iv15.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16.1.prol, i64 0
  %scevgep14.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.2.prol, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next16.2.prol = add nuw nsw i64 %indvars.iv15.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16.2.prol, i64 0
  %scevgep14.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.3.prol, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next16.3.prol = or i64 %indvars.iv15.unr, 4
  br label %for.body22.lr.ph.us.prol.loopexit36

for.body22.lr.ph.us.prol.loopexit36:              ; preds = %for.body22.lr.ph.us.prol39, %for.body22.lr.ph.us.preheader34
  %indvars.iv15.unr44 = phi i64 [ %indvars.iv15.unr, %for.body22.lr.ph.us.preheader34 ], [ %indvars.iv.next16.3.prol, %for.body22.lr.ph.us.prol39 ]
  %15 = icmp eq i64 %13, 0
  br i1 %15, label %for.end32.loopexit, label %for.body22.lr.ph.us.preheader34.new

for.body22.lr.ph.us.preheader34.new:              ; preds = %for.body22.lr.ph.us.prol.loopexit36
  br label %for.body22.lr.ph.us

for.body22.lr.ph.us:                              ; preds = %for.body22.lr.ph.us, %for.body22.lr.ph.us.preheader34.new
  %indvars.iv15 = phi i64 [ %indvars.iv15.unr44, %for.body22.lr.ph.us.preheader34.new ], [ %indvars.iv.next16.3.1, %for.body22.lr.ph.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv15, i64 0
  %scevgep14 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16, i64 0
  %scevgep14.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16.1, i64 0
  %scevgep14.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.2, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next16.2 = add nsw i64 %indvars.iv15, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16.2, i64 0
  %scevgep14.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.3, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next16.3 = add nsw i64 %indvars.iv15, 4
  %scevgep.145 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16.3, i64 0
  %scevgep14.146 = bitcast double* %scevgep.145 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.146, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next16.147 = add nsw i64 %indvars.iv15, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16.147, i64 0
  %scevgep14.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.1.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next16.1.1 = add nsw i64 %indvars.iv15, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16.1.1, i64 0
  %scevgep14.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.2.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next16.2.1 = add nsw i64 %indvars.iv15, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next16.2.1, i64 0
  %scevgep14.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.3.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next16.3.1 = add nsw i64 %indvars.iv15, 8
  %exitcond18.3.1 = icmp eq i64 %indvars.iv.next16.3.1, %8
  br i1 %exitcond18.3.1, label %for.end32.loopexit.unr-lcssa, label %for.body22.lr.ph.us

for.end32.loopexit.unr-lcssa:                     ; preds = %for.body22.lr.ph.us
  br label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.body22.lr.ph.us.prol.loopexit36, %for.end32.loopexit.unr-lcssa
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %for.body22.lr.ph.us.prol.loopexit, %for.cond15.preheader, %for.cond1.preheader.lr.ph
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  %cmp18 = icmp sgt i32 %n, 0
  br i1 %cmp18, label %for.cond1.preheader.preheader, label %for.end88

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
  %xtraiter82 = and i64 %3, 1
  %lcmp.mod83 = icmp eq i64 %xtraiter82, 0
  %8 = icmp eq i64 %4, 0
  %lcmp.mod85 = icmp ne i64 %xtraiter82, 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end85.for.cond1.preheader_crit_edge, %for.cond1.preheader.preheader
  %indvars.iv78 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next79, %for.end85.for.cond1.preheader_crit_edge ]
  %indvars.iv70 = phi i64 [ 1, %for.cond1.preheader.preheader ], [ %indvars.iv.next71, %for.end85.for.cond1.preheader_crit_edge ]
  %9 = mul nuw nsw i64 %indvars.iv78, 1201
  %10 = add nuw nsw i64 %9, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %10
  %scevgep61 = bitcast double* %scevgep to i8*
  %11 = sub i64 %1, %indvars.iv78
  %12 = shl i64 %11, 3
  %13 = and i64 %12, 34359738360
  %14 = add nuw nsw i64 %13, 8
  br i1 %6, label %for.body3.lr.ph, label %for.end.thread

for.end.thread:                                   ; preds = %for.cond1.preheader
  %arrayidx1389 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv78, i64 %indvars.iv78
  store double 0.000000e+00, double* %arrayidx1389, align 8
  br label %for.cond33.preheader

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br i1 %lcmp.mod, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol.for.body3.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.prol.for.body3.prol_crit_edge ], [ 0, %for.body3.prol.preheader ]
  %nrm.07.prol = phi double [ %add.prol, %for.body3.prol.for.body3.prol_crit_edge ], [ 0.000000e+00, %for.body3.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.prol.for.body3.prol_crit_edge ], [ %xtraiter, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.prol, i64 %indvars.iv78
  %15 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %15, %15
  %add.prol = fadd double %nrm.07.prol, %mul.prol
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
  %nrm.07.unr = phi double [ 0.000000e+00, %for.body3.lr.ph ], [ %add.prol, %for.body3.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.body3.lr.ph ], [ %add.prol, %for.body3.prol.loopexit.loopexit ]
  br i1 %7, label %for.end, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3 ], [ %indvars.iv.unr, %for.body3.preheader ]
  %nrm.07 = phi double [ %add.3, %for.body3 ], [ %nrm.07.unr, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv78
  %16 = load double, double* %arrayidx5, align 8
  %mul = fmul double %16, %16
  %add = fadd double %nrm.07, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv78
  %17 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %17, %17
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv78
  %18 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %18, %18
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv78
  %19 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %19, %19
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %3
  br i1 %exitcond.3, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3.prol.loopexit
  %nrm.0.lcssa = phi double [ %add.lcssa.unr, %for.body3.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %nrm.0.lcssa) #3
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv78, i64 %indvars.iv78
  store double %call, double* %arrayidx13, align 8
  br i1 %lcmp.mod83, label %for.body16.prol.loopexit.unr-lcssa, label %for.body16.prol.preheader

for.body16.prol.preheader:                        ; preds = %for.end
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv78
  %20 = load double, double* %arrayidx20.prol, align 8
  %div.prol = fdiv double %20, %call
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv78
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.body16.prol.loopexit.unr-lcssa

for.body16.prol.loopexit.unr-lcssa:               ; preds = %for.end, %for.body16.prol.preheader
  %indvars.iv51.unr.ph = phi i64 [ 1, %for.body16.prol.preheader ], [ 0, %for.end ]
  br i1 %8, label %for.cond33.preheader, label %for.body16.preheader

for.body16.preheader:                             ; preds = %for.body16.prol.loopexit.unr-lcssa
  br label %for.body16

for.cond33.preheader.loopexit:                    ; preds = %for.body16
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.cond33.preheader.loopexit, %for.body16.prol.loopexit.unr-lcssa, %for.end.thread
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %cmp3416 = icmp slt i64 %indvars.iv.next79, %2
  br i1 %cmp3416, label %for.body35.lr.ph, label %for.end85

for.body35.lr.ph:                                 ; preds = %for.cond33.preheader
  br i1 %6, label %for.body42.lr.ph.us.preheader, label %for.body35.preheader

for.body42.lr.ph.us.preheader:                    ; preds = %for.body35.lr.ph
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv78
  br label %for.body42.lr.ph.us

for.body35.preheader:                             ; preds = %for.body35.lr.ph
  call void @llvm.memset.p0i8.i64(i8* %scevgep61, i8 0, i64 %14, i32 8, i1 false)
  br label %for.end85

for.body42.lr.ph.us:                              ; preds = %for.cond33.loopexit.us, %for.body42.lr.ph.us.preheader
  %indvars.iv72 = phi i64 [ %indvars.iv70, %for.body42.lr.ph.us.preheader ], [ %indvars.iv.next73, %for.cond33.loopexit.us ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv78, i64 %indvars.iv72
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 %lcmp.mod85, label %for.body42.us.prol.preheader, label %for.body42.us.prol.loopexit.unr-lcssa

for.body42.us.prol.preheader:                     ; preds = %for.body42.lr.ph.us
  %21 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv72
  %22 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %21, %22
  %add56.us.prol = fadd double %mul51.us.prol, 0.000000e+00
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.body42.us.prol.loopexit.unr-lcssa

for.body42.us.prol.loopexit.unr-lcssa:            ; preds = %for.body42.lr.ph.us, %for.body42.us.prol.preheader
  %indvars.iv62.unr.ph = phi i64 [ 1, %for.body42.us.prol.preheader ], [ 0, %for.body42.lr.ph.us ]
  %.unr.ph = phi double [ %add56.us.prol, %for.body42.us.prol.preheader ], [ 0.000000e+00, %for.body42.lr.ph.us ]
  br i1 %8, label %for.body62.us.preheader, label %for.body42.us.preheader

for.body42.us.preheader:                          ; preds = %for.body42.us.prol.loopexit.unr-lcssa
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us.preheader, %for.body42.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.1, %for.body42.us ], [ %indvars.iv62.unr.ph, %for.body42.us.preheader ]
  %23 = phi double [ %add56.us.1, %for.body42.us ], [ %.unr.ph, %for.body42.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv62, i64 %indvars.iv78
  %24 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv62, i64 %indvars.iv72
  %25 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %24, %25
  %add56.us = fadd double %23, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next63, i64 %indvars.iv78
  %26 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next63, i64 %indvars.iv72
  %27 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %26, %27
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next63.1, %3
  br i1 %exitcond65.1, label %for.body62.us.preheader.loopexit, label %for.body42.us

for.body62.us.preheader.loopexit:                 ; preds = %for.body42.us
  br label %for.body62.us.preheader

for.body62.us.preheader:                          ; preds = %for.body62.us.preheader.loopexit, %for.body42.us.prol.loopexit.unr-lcssa
  %28 = phi double [ %.unr.ph, %for.body42.us.prol.loopexit.unr-lcssa ], [ %add56.us.1, %for.body62.us.preheader.loopexit ]
  br i1 %lcmp.mod85, label %for.body62.us.prol.preheader, label %for.body62.us.prol.loopexit.unr-lcssa

for.body62.us.prol.preheader:                     ; preds = %for.body62.us.preheader
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv72
  %29 = load double, double* %arrayidx66.us.prol, align 8
  %30 = load double, double* %arrayidx46.us.prol, align 8
  %mul75.us.prol = fmul double %30, %28
  %sub.us.prol = fsub double %29, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.body62.us.prol.loopexit.unr-lcssa

for.body62.us.prol.loopexit.unr-lcssa:            ; preds = %for.body62.us.preheader, %for.body62.us.prol.preheader
  %indvars.iv66.unr.ph = phi i64 [ 1, %for.body62.us.prol.preheader ], [ 0, %for.body62.us.preheader ]
  br i1 %8, label %for.cond33.loopexit.us, label %for.body62.us.preheader93

for.body62.us.preheader93:                        ; preds = %for.body62.us.prol.loopexit.unr-lcssa
  br label %for.body62.us

for.body62.us:                                    ; preds = %for.body62.us.preheader93, %for.body62.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67.1, %for.body62.us ], [ %indvars.iv66.unr.ph, %for.body62.us.preheader93 ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv72
  %31 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv66, i64 %indvars.iv78
  %32 = load double, double* %arrayidx70.us, align 8
  %33 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %32, %33
  %sub.us = fsub double %31, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next67, i64 %indvars.iv72
  %34 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next67, i64 %indvars.iv78
  %35 = load double, double* %arrayidx70.us.1, align 8
  %36 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %35, %36
  %sub.us.1 = fsub double %34, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next67.1 = add nuw nsw i64 %indvars.iv66, 2
  %exitcond69.1 = icmp eq i64 %indvars.iv.next67.1, %3
  br i1 %exitcond69.1, label %for.cond33.loopexit.us.loopexit, label %for.body62.us

for.cond33.loopexit.us.loopexit:                  ; preds = %for.body62.us
  br label %for.cond33.loopexit.us

for.cond33.loopexit.us:                           ; preds = %for.cond33.loopexit.us.loopexit, %for.body62.us.prol.loopexit.unr-lcssa
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond = icmp eq i64 %indvars.iv.next73, %5
  br i1 %exitcond, label %for.end85.loopexit, label %for.body42.lr.ph.us

for.body16:                                       ; preds = %for.body16.preheader, %for.body16
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.1, %for.body16 ], [ %indvars.iv51.unr.ph, %for.body16.preheader ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv78
  %37 = load double, double* %arrayidx20, align 8
  %38 = load double, double* %arrayidx13, align 8
  %div = fdiv double %37, %38
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv51, i64 %indvars.iv78
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next52, i64 %indvars.iv78
  %39 = load double, double* %arrayidx20.1, align 8
  %40 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %39, %40
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next52, i64 %indvars.iv78
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next52.1 = add nuw nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, %3
  br i1 %exitcond54.1, label %for.cond33.preheader.loopexit, label %for.body16

for.end85.loopexit:                               ; preds = %for.cond33.loopexit.us
  br label %for.end85

for.end85:                                        ; preds = %for.end85.loopexit, %for.cond33.preheader, %for.body35.preheader
  %exitcond92 = icmp eq i64 %indvars.iv.next79, %5
  br i1 %exitcond92, label %for.end88.loopexit, label %for.end85.for.cond1.preheader_crit_edge

for.end85.for.cond1.preheader_crit_edge:          ; preds = %for.end85
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  br label %for.cond1.preheader

for.end88.loopexit:                               ; preds = %for.end85
  br label %for.end88

for.end88:                                        ; preds = %for.end88.loopexit, %entry
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
  br i1 %cmp8, label %for.body4.lr.ph.us.preheader, label %for.end12

for.body4.lr.ph.us.preheader:                     ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  br label %for.body4.lr.ph.us

for.body4.lr.ph.us:                               ; preds = %for.end.us, %for.body4.lr.ph.us.preheader
  %indvars.iv24 = phi i64 [ 0, %for.body4.lr.ph.us.preheader ], [ %indvars.iv.next25, %for.end.us ]
  %5 = mul nsw i64 %indvars.iv24, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body4.lr.ph.us
  %indvars.iv19 = phi i64 [ 0, %for.body4.lr.ph.us ], [ %indvars.iv.next20, %if.end.us ]
  %6 = add nsw i64 %indvars.iv19, %5
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv24, i64 %indvars.iv19
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next20, %4
  br i1 %exitcond30, label %for.end.us, label %for.body4.us

for.end.us:                                       ; preds = %if.end.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next25, %4
  br i1 %exitcond28, label %for.end12.loopexit, label %for.body4.lr.ph.us

for.end12.loopexit:                               ; preds = %for.end.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %cmp163.not = icmp slt i32 %m, 1
  %cmp8.not = xor i1 %cmp8, true
  %brmerge = or i1 %cmp163.not, %cmp8.not
  br i1 %brmerge, label %for.end38, label %for.body20.lr.ph.us.preheader

for.body20.lr.ph.us.preheader:                    ; preds = %for.end12
  %13 = sext i32 %n to i64
  %14 = zext i32 %n to i64
  %15 = zext i32 %m to i64
  br label %for.body20.lr.ph.us

for.body20.lr.ph.us:                              ; preds = %for.end35.us, %for.body20.lr.ph.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.body20.lr.ph.us.preheader ], [ %indvars.iv.next14, %for.end35.us ]
  %16 = mul nsw i64 %indvars.iv13, %13
  br label %for.body20.us

for.body20.us:                                    ; preds = %if.end27.us, %for.body20.lr.ph.us
  %indvars.iv = phi i64 [ 0, %for.body20.lr.ph.us ], [ %indvars.iv.next, %if.end27.us ]
  %17 = add nsw i64 %indvars.iv, %16
  %18 = trunc i64 %17 to i32
  %rem23.us = srem i32 %18, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %if.end27.us

if.then25.us:                                     ; preds = %for.body20.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #5
  br label %if.end27.us

if.end27.us:                                      ; preds = %for.body20.us, %if.then25.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv13, i64 %indvars.iv
  %21 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next, %14
  br i1 %exitcond29, label %for.end35.us, label %for.body20.us

for.end35.us:                                     ; preds = %if.end27.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, %15
  br i1 %exitcond, label %for.end38.loopexit, label %for.body20.lr.ph.us

for.end38.loopexit:                               ; preds = %for.end35.us
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.end12
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
