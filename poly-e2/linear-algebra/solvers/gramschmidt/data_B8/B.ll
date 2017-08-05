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
define internal fastcc void @init_array(i32 %m, i32 %n, [1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #2 {
entry:
  %cmp24 = icmp sgt i32 %m, 0
  br i1 %cmp24, label %for.cond1.preheader.lr.ph, label %for.cond15.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp222 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  br i1 %cmp222, label %for.cond1.preheader.us.preheader, label %for.end32

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = zext i32 %n to i64
  %1 = zext i32 %m to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc12_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv35 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next36, %for.cond1.for.inc12_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv29 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next30, %for.body3.us ]
  %2 = mul nuw nsw i64 %indvars.iv29, %indvars.iv35
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv29
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv35, i64 %indvars.iv29
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next30, %0
  br i1 %exitcond41, label %for.cond1.for.inc12_crit_edge.us, label %for.body3.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond = icmp eq i64 %indvars.iv.next36, %1
  br i1 %exitcond, label %for.cond15.preheader.loopexit, label %for.cond1.preheader.us

for.cond15.preheader.loopexit:                    ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  %cmp1620 = icmp sgt i32 %n, 0
  br i1 %cmp1620, label %for.cond19.preheader.us.preheader, label %for.end32

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

for.cond19.for.inc30_crit_edge.us.prol:           ; preds = %for.cond19.for.inc30_crit_edge.us.prol, %for.cond19.for.inc30_crit_edge.us.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %for.cond19.for.inc30_crit_edge.us.prol.preheader ], [ %indvars.iv.next.prol, %for.cond19.for.inc30_crit_edge.us.prol ]
  %prol.iter = phi i32 [ %xtraiter, %for.cond19.for.inc30_crit_edge.us.prol.preheader ], [ %prol.iter.sub, %for.cond19.for.inc30_crit_edge.us.prol ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.prol, i64 0
  %scevgep28.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.prol, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond19.preheader.us.prol.loopexit.loopexit, label %for.cond19.for.inc30_crit_edge.us.prol, !llvm.loop !1

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
  %lcmp.mod43 = icmp eq i64 %15, 0
  br i1 %lcmp.mod43, label %for.cond19.for.inc30_crit_edge.us.3.prol.preheader, label %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit

for.cond19.for.inc30_crit_edge.us.3.prol.preheader: ; preds = %for.cond19.for.inc30_crit_edge.us.3.preheader
  br label %for.cond19.for.inc30_crit_edge.us.3.prol

for.cond19.for.inc30_crit_edge.us.3.prol:         ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.preheader
  %scevgep.prol45 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.unr, i64 0
  %scevgep28.prol46 = bitcast double* %scevgep.prol45 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.prol46, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.prol47 = add nuw nsw i64 %indvars.iv.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.prol47, i64 0
  %scevgep28.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.1.prol, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1.prol, i64 0
  %scevgep28.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.2.prol, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.2.prol = add nsw i64 %indvars.iv.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2.prol, i64 0
  %scevgep28.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.3.prol, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit

for.cond19.for.inc30_crit_edge.us.3.prol.loopexit: ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol, %for.cond19.for.inc30_crit_edge.us.3.preheader
  %indvars.iv.unr48 = phi i64 [ %indvars.iv.unr, %for.cond19.for.inc30_crit_edge.us.3.preheader ], [ %indvars.iv.next.3.prol, %for.cond19.for.inc30_crit_edge.us.3.prol ]
  %16 = icmp eq i64 %14, 0
  br i1 %16, label %for.end32.loopexit, label %for.cond19.for.inc30_crit_edge.us.3.preheader.new

for.cond19.for.inc30_crit_edge.us.3.preheader.new: ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit
  br label %for.cond19.for.inc30_crit_edge.us.3

for.end32.loopexit.unr-lcssa:                     ; preds = %for.cond19.for.inc30_crit_edge.us.3
  br label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit, %for.end32.loopexit.unr-lcssa
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %for.cond19.preheader.us.prol.loopexit, %for.cond15.preheader, %for.cond1.preheader.lr.ph
  ret void

for.cond19.for.inc30_crit_edge.us.3:              ; preds = %for.cond19.for.inc30_crit_edge.us.3, %for.cond19.for.inc30_crit_edge.us.3.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr48, %for.cond19.for.inc30_crit_edge.us.3.preheader.new ], [ %indvars.iv.next.3.1, %for.cond19.for.inc30_crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 0
  %scevgep28 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next, i64 0
  %scevgep28.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1, i64 0
  %scevgep28.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.2, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2, i64 0
  %scevgep28.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.3, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %scevgep.149 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.3, i64 0
  %scevgep28.150 = bitcast double* %scevgep.149 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.150, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.151 = add nsw i64 %indvars.iv, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.151, i64 0
  %scevgep28.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.1.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1.1, i64 0
  %scevgep28.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.2.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.2.1 = add nsw i64 %indvars.iv, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2.1, i64 0
  %scevgep28.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.3.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %wide.trip.count.3
  br i1 %exitcond.3.1, label %for.end32.loopexit.unr-lcssa, label %for.cond19.for.inc30_crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  %cmp96 = icmp sgt i32 %n, 0
  br i1 %cmp96, label %for.cond1.preheader.lr.ph, label %for.end88

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
  %xtraiter102 = and i32 %m, 1
  %9 = icmp sgt i32 %m, 0
  %10 = icmp eq i32 %4, 0
  %11 = icmp ult i32 %0, 3
  %12 = icmp sgt i32 %m, 0
  %13 = icmp eq i32 %xtraiter102, 0
  %14 = icmp eq i32 %0, 0
  %15 = icmp sgt i32 %m, 0
  %16 = icmp eq i32 %xtraiter102, 0
  %17 = icmp eq i32 %0, 0
  %18 = icmp eq i32 %xtraiter102, 0
  %19 = icmp eq i32 %0, 0
  %sunkaddr144 = ptrtoint [1200 x double]* %Q to i64
  %sunkaddr = ptrtoint [1200 x double]* %Q to i64
  br label %for.cond1.preheader

for.cond.loopexit.loopexit98:                     ; preds = %for.body35.lr.ph
  %20 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %20, i8 0, i64 %26, i32 8, i1 false)
  br label %for.cond.loopexit

for.cond.loopexit.loopexit:                       ; preds = %for.inc83.us
  br label %for.cond.loopexit

for.cond.loopexit:                                ; preds = %for.cond.loopexit.loopexit, %for.end31, %for.cond.loopexit.loopexit98
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %exitcond = icmp eq i64 %indvars.iv.next133, %8
  br i1 %exitcond, label %for.end88.loopexit, label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.loopexit, %for.cond1.preheader.lr.ph
  %indvars.iv132 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next133, %for.cond.loopexit ]
  %indvars.iv125 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next126, %for.cond.loopexit ]
  %21 = mul nuw nsw i64 %indvars.iv132, 1201
  %22 = add nuw nsw i64 %21, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %22
  %23 = sub i64 %2, %indvars.iv132
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  %26 = add nuw nsw i64 %25, 8
  br i1 %9, label %for.body3.lr.ph, label %for.end

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br i1 %10, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %nrm.057.prol = phi double [ %add.prol, %for.body3.prol ], [ 0.000000e+00, %for.body3.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.prol ], [ %4, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.prol, i64 %indvars.iv132
  %27 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %27, %27
  %add.prol = fadd double %nrm.057.prol, %mul.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !3

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph ], [ %7, %for.body3.prol.loopexit.loopexit ]
  %nrm.057.unr = phi double [ 0.000000e+00, %for.body3.lr.ph ], [ %add.prol, %for.body3.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.body3.lr.ph ], [ %add.prol, %for.body3.prol.loopexit.loopexit ]
  br i1 %11, label %for.end, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3 ], [ %indvars.iv.unr, %for.body3.preheader ]
  %nrm.057 = phi double [ %add.3, %for.body3 ], [ %nrm.057.unr, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv132
  %28 = load double, double* %arrayidx5, align 8
  %mul = fmul double %28, %28
  %add = fadd double %nrm.057, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv132
  %29 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %29, %29
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv132
  %30 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %30, %30
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv132
  %31 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %31, %31
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3.prol.loopexit, %for.cond1.preheader
  %nrm.0.lcssa = phi double [ 0.000000e+00, %for.cond1.preheader ], [ %add.lcssa.unr, %for.body3.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %nrm.0.lcssa) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv132, i64 %indvars.iv132
  store double %call, double* %arrayidx13, align 8
  br i1 %12, label %for.body16.preheader, label %for.end31

for.body16.preheader:                             ; preds = %for.end
  br i1 %13, label %for.body16.prol.loopexit, label %for.body16.prol

for.body16.prol:                                  ; preds = %for.body16.preheader
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv132
  %32 = load double, double* %arrayidx20.prol, align 8
  %div.prol = fdiv double %32, %call
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv132
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.body16.prol.loopexit

for.body16.prol.loopexit:                         ; preds = %for.body16.preheader, %for.body16.prol
  %indvars.iv99.unr.ph = phi i64 [ 1, %for.body16.prol ], [ 0, %for.body16.preheader ]
  br i1 %14, label %for.end31, label %for.body16.preheader149

for.body16.preheader149:                          ; preds = %for.body16.prol.loopexit
  br label %for.body16

for.body16:                                       ; preds = %for.body16.preheader149, %for.body16
  %indvars.iv99 = phi i64 [ %indvars.iv.next100.1, %for.body16 ], [ %indvars.iv99.unr.ph, %for.body16.preheader149 ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv132
  %33 = load double, double* %arrayidx20, align 8
  %34 = load double, double* %arrayidx13, align 8
  %div = fdiv double %33, %34
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv99, i64 %indvars.iv132
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next100, i64 %indvars.iv132
  %35 = load double, double* %arrayidx20.1, align 8
  %36 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %35, %36
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next100, i64 %indvars.iv132
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next100.1 = add nuw nsw i64 %indvars.iv99, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next100.1, %wide.trip.count.3
  br i1 %exitcond.1, label %for.end31.loopexit, label %for.body16

for.end31.loopexit:                               ; preds = %for.body16
  br label %for.end31

for.end31:                                        ; preds = %for.end31.loopexit, %for.body16.prol.loopexit, %for.end
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %cmp3464 = icmp slt i64 %indvars.iv.next133, %3
  br i1 %cmp3464, label %for.body35.lr.ph, label %for.cond.loopexit

for.body35.lr.ph:                                 ; preds = %for.end31
  br i1 %15, label %for.body35.us.preheader, label %for.cond.loopexit.loopexit98

for.body35.us.preheader:                          ; preds = %for.body35.lr.ph
  %sunkaddr145 = shl i64 %indvars.iv132, 3
  %sunkaddr146 = add i64 %sunkaddr144, %sunkaddr145
  %sunkaddr147 = inttoptr i64 %sunkaddr146 to double*
  %sunkaddr141 = shl i64 %indvars.iv132, 3
  %sunkaddr142 = add i64 %sunkaddr, %sunkaddr141
  %sunkaddr143 = inttoptr i64 %sunkaddr142 to double*
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.body35.us.preheader, %for.inc83.us
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %for.inc83.us ], [ %indvars.iv125, %for.body35.us.preheader ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv132, i64 %indvars.iv127
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 %16, label %for.body42.us.prol.loopexit, label %for.body42.us.prol

for.body42.us.prol:                               ; preds = %for.body35.us
  %37 = load double, double* %sunkaddr143, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv127
  %38 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %37, %38
  %add56.us.prol = fadd double %mul51.us.prol, 0.000000e+00
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.body42.us.prol.loopexit

for.body42.us.prol.loopexit:                      ; preds = %for.body35.us, %for.body42.us.prol
  %39 = phi double [ %add56.us.prol, %for.body42.us.prol ], [ 0.000000e+00, %for.body35.us ]
  %indvars.iv111.unr.ph = phi i64 [ 1, %for.body42.us.prol ], [ 0, %for.body35.us ]
  br i1 %17, label %for.body62.us.preheader, label %for.body42.us.preheader

for.body42.us.preheader:                          ; preds = %for.body42.us.prol.loopexit
  br label %for.body42.us

for.inc83.us.loopexit:                            ; preds = %for.body62.us
  br label %for.inc83.us

for.inc83.us:                                     ; preds = %for.inc83.us.loopexit, %for.body62.us.prol.loopexit
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next128, %8
  br i1 %exitcond138, label %for.cond.loopexit.loopexit, label %for.body35.us

for.body62.us:                                    ; preds = %for.body62.us.preheader148, %for.body62.us
  %indvars.iv118 = phi i64 [ %indvars.iv.next119.1, %for.body62.us ], [ %indvars.iv118.unr.ph, %for.body62.us.preheader148 ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv127
  %40 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv118, i64 %indvars.iv132
  %41 = load double, double* %arrayidx70.us, align 8
  %42 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %41, %42
  %sub.us = fsub double %40, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next119, i64 %indvars.iv127
  %43 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next119, i64 %indvars.iv132
  %44 = load double, double* %arrayidx70.us.1, align 8
  %45 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %44, %45
  %sub.us.1 = fsub double %43, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next119.1 = add nuw nsw i64 %indvars.iv118, 2
  %exitcond.1124 = icmp eq i64 %indvars.iv.next119.1, %wide.trip.count.3
  br i1 %exitcond.1124, label %for.inc83.us.loopexit, label %for.body62.us

for.body42.us:                                    ; preds = %for.body42.us.preheader, %for.body42.us
  %46 = phi double [ %add56.us.1, %for.body42.us ], [ %39, %for.body42.us.preheader ]
  %indvars.iv111 = phi i64 [ %indvars.iv.next112.1, %for.body42.us ], [ %indvars.iv111.unr.ph, %for.body42.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv111, i64 %indvars.iv132
  %47 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv111, i64 %indvars.iv127
  %48 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %47, %48
  %add56.us = fadd double %46, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next112, i64 %indvars.iv132
  %49 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next112, i64 %indvars.iv127
  %50 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %49, %50
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next112.1 = add nuw nsw i64 %indvars.iv111, 2
  %exitcond.1117 = icmp eq i64 %indvars.iv.next112.1, %wide.trip.count.3
  br i1 %exitcond.1117, label %for.body62.us.preheader.loopexit, label %for.body42.us

for.body62.us.preheader.loopexit:                 ; preds = %for.body42.us
  br label %for.body62.us.preheader

for.body62.us.preheader:                          ; preds = %for.body62.us.preheader.loopexit, %for.body42.us.prol.loopexit
  %51 = phi double [ %39, %for.body42.us.prol.loopexit ], [ %add56.us.1, %for.body62.us.preheader.loopexit ]
  br i1 %18, label %for.body62.us.prol.loopexit, label %for.body62.us.prol

for.body62.us.prol:                               ; preds = %for.body62.us.preheader
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv127
  %52 = load double, double* %arrayidx66.us.prol, align 8
  %53 = load double, double* %sunkaddr147, align 8
  %mul75.us.prol = fmul double %53, %51
  %sub.us.prol = fsub double %52, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.body62.us.prol.loopexit

for.body62.us.prol.loopexit:                      ; preds = %for.body62.us.preheader, %for.body62.us.prol
  %indvars.iv118.unr.ph = phi i64 [ 1, %for.body62.us.prol ], [ 0, %for.body62.us.preheader ]
  br i1 %19, label %for.inc83.us, label %for.body62.us.preheader148

for.body62.us.preheader148:                       ; preds = %for.body62.us.prol.loopexit
  br label %for.body62.us

for.end88.loopexit:                               ; preds = %for.cond.loopexit
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
  %indvars.iv25 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next26, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv25, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv20 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next21, %if.end.us ]
  %6 = add nsw i64 %indvars.iv20, %5
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv25, i64 %indvars.iv20
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next21, %4
  br i1 %exitcond31, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next26, %4
  br i1 %exitcond32, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = icmp sgt i32 %n, 0
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %cmp166 = icmp sgt i32 %m, 0
  %or.cond = and i1 %cmp166, %11
  br i1 %or.cond, label %for.cond18.preheader.us.preheader, label %for.end38

for.cond18.preheader.us.preheader:                ; preds = %for.end12
  %14 = sext i32 %n to i64
  %15 = zext i32 %n to i64
  %16 = zext i32 %m to i64
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.for.inc36_crit_edge.us, %for.cond18.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %for.cond18.preheader.us.preheader ], [ %indvars.iv.next15, %for.cond18.for.inc36_crit_edge.us ]
  %17 = mul nsw i64 %indvars.iv14, %14
  br label %for.body20.us

for.body20.us:                                    ; preds = %if.end27.us, %for.cond18.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next, %if.end27.us ]
  %18 = add nsw i64 %indvars.iv, %17
  %19 = trunc i64 %18 to i32
  %rem23.us = srem i32 %19, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %if.end27.us

if.then25.us:                                     ; preds = %for.body20.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %if.end27.us

if.end27.us:                                      ; preds = %for.body20.us, %if.then25.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv14, i64 %indvars.iv
  %22 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next, %15
  br i1 %exitcond30, label %for.cond18.for.inc36_crit_edge.us, label %for.body20.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %if.end27.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, %16
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
