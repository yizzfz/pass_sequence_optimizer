; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph8.preheader, label %.preheader2

.lr.ph8.preheader:                                ; preds = %7
  %wide.trip.count17 = zext i32 %0 to i64
  %9 = add nsw i64 %wide.trip.count17, -1
  %xtraiter = and i64 %wide.trip.count17, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph8.prol.loopexit, label %.lr.ph8.prol.preheader

.lr.ph8.prol.preheader:                           ; preds = %.lr.ph8.preheader
  br label %.lr.ph8.prol

.lr.ph8.prol:                                     ; preds = %.lr.ph8.prol, %.lr.ph8.prol.preheader
  %indvars.iv15.prol = phi i64 [ %indvars.iv.next16.prol, %.lr.ph8.prol ], [ 0, %.lr.ph8.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph8.prol ], [ %xtraiter, %.lr.ph8.prol.preheader ]
  %10 = trunc i64 %indvars.iv15.prol to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %6, i64 %indvars.iv15.prol
  store double %11, double* %12, align 8
  %indvars.iv.next16.prol = add nuw nsw i64 %indvars.iv15.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph8.prol.loopexit.unr-lcssa, label %.lr.ph8.prol, !llvm.loop !1

.lr.ph8.prol.loopexit.unr-lcssa:                  ; preds = %.lr.ph8.prol
  br label %.lr.ph8.prol.loopexit

.lr.ph8.prol.loopexit:                            ; preds = %.lr.ph8.preheader, %.lr.ph8.prol.loopexit.unr-lcssa
  %indvars.iv15.unr = phi i64 [ 0, %.lr.ph8.preheader ], [ %indvars.iv.next16.prol, %.lr.ph8.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %9, 7
  br i1 %13, label %.preheader2.loopexit, label %.lr.ph8.preheader.new

.lr.ph8.preheader.new:                            ; preds = %.lr.ph8.prol.loopexit
  br label %.lr.ph8

.preheader2.loopexit.unr-lcssa:                   ; preds = %.lr.ph8
  br label %.preheader2.loopexit

.preheader2.loopexit:                             ; preds = %.lr.ph8.prol.loopexit, %.preheader2.loopexit.unr-lcssa
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.loopexit, %7
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.preheader.lr.ph, label %._crit_edge5

.preheader.lr.ph:                                 ; preds = %.preheader2
  %15 = icmp sgt i32 %2, 0
  %16 = sitofp i32 %1 to double
  %17 = sitofp i32 %2 to double
  br i1 %15, label %.preheader.us.preheader, label %._crit_edge5

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %2 to i64
  %wide.trip.count12 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %18 = trunc i64 %indvars.iv10 to i32
  %19 = sitofp i32 %18 to double
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %20 = trunc i64 %indvars.iv.next to i32
  %21 = sitofp i32 %20 to double
  %22 = fmul double %19, %21
  %23 = fdiv double %22, %16
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv
  store double %23, double* %24, align 8
  %25 = add nuw nsw i64 %indvars.iv, 2
  %26 = trunc i64 %25 to i32
  %27 = sitofp i32 %26 to double
  %28 = fmul double %19, %27
  %29 = fdiv double %28, %17
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv10, i64 %indvars.iv
  store double %29, double* %30, align 8
  %31 = add nuw nsw i64 %indvars.iv, 3
  %32 = trunc i64 %31 to i32
  %33 = sitofp i32 %32 to double
  %34 = fmul double %19, %33
  %35 = fdiv double %34, %16
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv10, i64 %indvars.iv
  store double %35, double* %36, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, %wide.trip.count12
  br i1 %exitcond13, label %._crit_edge5.loopexit, label %.preheader.us

.lr.ph8:                                          ; preds = %.lr.ph8, %.lr.ph8.preheader.new
  %indvars.iv15 = phi i64 [ %indvars.iv15.unr, %.lr.ph8.preheader.new ], [ %indvars.iv.next16.7, %.lr.ph8 ]
  %37 = trunc i64 %indvars.iv15 to i32
  %38 = sitofp i32 %37 to double
  %39 = getelementptr inbounds double, double* %6, i64 %indvars.iv15
  store double %38, double* %39, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %40 = trunc i64 %indvars.iv.next16 to i32
  %41 = sitofp i32 %40 to double
  %42 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16
  store double %41, double* %42, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %43 = trunc i64 %indvars.iv.next16.1 to i32
  %44 = sitofp i32 %43 to double
  %45 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.1
  store double %44, double* %45, align 8
  %indvars.iv.next16.2 = add nsw i64 %indvars.iv15, 3
  %46 = trunc i64 %indvars.iv.next16.2 to i32
  %47 = sitofp i32 %46 to double
  %48 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.2
  store double %47, double* %48, align 8
  %indvars.iv.next16.3 = add nsw i64 %indvars.iv15, 4
  %49 = trunc i64 %indvars.iv.next16.3 to i32
  %50 = sitofp i32 %49 to double
  %51 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.3
  store double %50, double* %51, align 8
  %indvars.iv.next16.4 = add nsw i64 %indvars.iv15, 5
  %52 = trunc i64 %indvars.iv.next16.4 to i32
  %53 = sitofp i32 %52 to double
  %54 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.4
  store double %53, double* %54, align 8
  %indvars.iv.next16.5 = add nsw i64 %indvars.iv15, 6
  %55 = trunc i64 %indvars.iv.next16.5 to i32
  %56 = sitofp i32 %55 to double
  %57 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.5
  store double %56, double* %57, align 8
  %indvars.iv.next16.6 = add nsw i64 %indvars.iv15, 7
  %58 = trunc i64 %indvars.iv.next16.6 to i32
  %59 = sitofp i32 %58 to double
  %60 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.6
  store double %59, double* %60, align 8
  %indvars.iv.next16.7 = add nsw i64 %indvars.iv15, 8
  %exitcond18.7 = icmp eq i64 %indvars.iv.next16.7, %wide.trip.count17
  br i1 %exitcond18.7, label %.preheader2.loopexit.unr-lcssa, label %.lr.ph8

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %.preheader.lr.ph, %.preheader2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader10.lr.ph, label %._crit_edge25

.preheader10.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %2, 0
  %10 = add nsw i32 %1, -1
  %11 = add nsw i32 %2, -1
  %wide.trip.count = zext i32 %2 to i64
  %wide.trip.count36 = zext i32 %1 to i64
  %wide.trip.count54 = zext i32 %10 to i64
  %wide.trip.count50 = zext i32 %11 to i64
  %wide.trip.count58 = zext i32 %0 to i64
  %12 = add nuw nsw i64 %wide.trip.count50, 1
  %13 = add nsw i64 %wide.trip.count, -1
  %scevgep177 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %wide.trip.count
  %14 = add nsw i64 %wide.trip.count, -1
  %15 = add nsw i64 %wide.trip.count, -1
  %16 = add nsw i64 %wide.trip.count, -1
  %min.iters.check171 = icmp ult i32 %2, 4
  %17 = and i32 %2, 3
  %n.mod.vf173 = zext i32 %17 to i64
  %n.vec174 = sub nsw i64 %wide.trip.count, %n.mod.vf173
  %cmp.zero175 = icmp eq i64 %n.vec174, 0
  %cmp.n189 = icmp eq i32 %17, 0
  %.not = icmp slt i32 %1, 2
  %.not63 = icmp slt i32 %2, 1
  %brmerge = or i1 %.not, %.not63
  %.not64 = icmp slt i32 %1, 1
  %.not65 = icmp slt i32 %2, 2
  %brmerge66 = or i1 %.not64, %.not65
  %brmerge69 = or i1 %.not, %.not65
  %min.iters.check = icmp ult i32 %11, 4
  %18 = and i32 %11, 3
  %n.mod.vf = zext i32 %18 to i64
  %n.vec = sub nsw i64 %wide.trip.count50, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %18, 0
  %min.iters.check97 = icmp ult i64 %13, 4
  %n.vec100 = and i64 %13, -4
  %cmp.zero101 = icmp eq i64 %n.vec100, 0
  %ind.end = or i64 %n.vec100, 1
  %cmp.n120 = icmp eq i64 %13, %n.vec100
  %min.iters.check134 = icmp ult i32 %2, 4
  %19 = and i32 %2, 3
  %n.mod.vf136 = zext i32 %19 to i64
  %n.vec137 = sub nsw i64 %wide.trip.count, %n.mod.vf136
  %cmp.zero138 = icmp eq i64 %n.vec137, 0
  %cmp.n157 = icmp eq i32 %19, 0
  br label %.preheader10

.preheader10:                                     ; preds = %._crit_edge23, %.preheader10.lr.ph
  %indvars.iv56 = phi i64 [ 0, %.preheader10.lr.ph ], [ %indvars.iv.next57, %._crit_edge23 ]
  br i1 %9, label %.lr.ph, label %.preheader9

.lr.ph:                                           ; preds = %.preheader10
  %20 = getelementptr inbounds double, double* %6, i64 %indvars.iv56
  %21 = bitcast double* %20 to i64*
  br i1 %min.iters.check171, label %._crit_edge60.preheader, label %min.iters.checked172

._crit_edge60.preheader:                          ; preds = %middle.block169, %vector.memcheck184, %min.iters.checked172, %.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck184 ], [ 0, %min.iters.checked172 ], [ 0, %.lr.ph ], [ %n.vec174, %middle.block169 ]
  %22 = sub nsw i64 %wide.trip.count, %indvars.iv.ph
  %23 = sub nsw i64 %14, %indvars.iv.ph
  %xtraiter = and i64 %22, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge60.prol.loopexit, label %._crit_edge60.prol.preheader

._crit_edge60.prol.preheader:                     ; preds = %._crit_edge60.preheader
  br label %._crit_edge60.prol

._crit_edge60.prol:                               ; preds = %._crit_edge60.prol, %._crit_edge60.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge60.prol ], [ %indvars.iv.ph, %._crit_edge60.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge60.prol ], [ %xtraiter, %._crit_edge60.prol.preheader ]
  %24 = load i64, i64* %21, align 8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.prol
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge60.prol.loopexit.unr-lcssa, label %._crit_edge60.prol, !llvm.loop !3

._crit_edge60.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge60.prol
  br label %._crit_edge60.prol.loopexit

._crit_edge60.prol.loopexit:                      ; preds = %._crit_edge60.preheader, %._crit_edge60.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %._crit_edge60.preheader ], [ %indvars.iv.next.prol, %._crit_edge60.prol.loopexit.unr-lcssa ]
  %27 = icmp ult i64 %23, 7
  br i1 %27, label %.preheader9.loopexit, label %._crit_edge60.preheader.new

._crit_edge60.preheader.new:                      ; preds = %._crit_edge60.prol.loopexit
  br label %._crit_edge60

min.iters.checked172:                             ; preds = %.lr.ph
  br i1 %cmp.zero175, label %._crit_edge60.preheader, label %vector.memcheck184

vector.memcheck184:                               ; preds = %min.iters.checked172
  %28 = bitcast double* %20 to [1200 x double]*
  %bound0180 = icmp ugt [1200 x double]* %28, %4
  %bound1181 = icmp ult double* %20, %scevgep177
  %memcheck.conflict183 = and i1 %bound0180, %bound1181
  br i1 %memcheck.conflict183, label %._crit_edge60.preheader, label %vector.body168.preheader

vector.body168.preheader:                         ; preds = %vector.memcheck184
  %.pre = load i64, i64* %21, align 8, !alias.scope !4
  %29 = insertelement <2 x i64> undef, i64 %.pre, i32 0
  %30 = shufflevector <2 x i64> %29, <2 x i64> undef, <2 x i32> zeroinitializer
  br label %vector.body168

vector.body168:                                   ; preds = %vector.body168.preheader, %vector.body168
  %index186 = phi i64 [ %index.next187, %vector.body168 ], [ 0, %vector.body168.preheader ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %index186
  %32 = bitcast double* %31 to <2 x i64>*
  store <2 x i64> %30, <2 x i64>* %32, align 8, !alias.scope !7, !noalias !4
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x i64>*
  store <2 x i64> %30, <2 x i64>* %34, align 8, !alias.scope !7, !noalias !4
  %index.next187 = add i64 %index186, 4
  %35 = icmp eq i64 %index.next187, %n.vec174
  br i1 %35, label %middle.block169, label %vector.body168, !llvm.loop !9

middle.block169:                                  ; preds = %vector.body168
  br i1 %cmp.n189, label %.preheader9, label %._crit_edge60.preheader

.preheader9.loopexit.unr-lcssa:                   ; preds = %._crit_edge60
  br label %.preheader9.loopexit

.preheader9.loopexit:                             ; preds = %._crit_edge60.prol.loopexit, %.preheader9.loopexit.unr-lcssa
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit, %middle.block169, %.preheader10
  br i1 %brmerge, label %.preheader8, label %.preheader6.us.preheader

.preheader6.us.preheader:                         ; preds = %.preheader9
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %36, %._crit_edge.us ], [ 0, %.preheader6.us.preheader ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge.us ], [ 1, %.preheader6.us.preheader ]
  %36 = add nuw nsw i64 %indvar, 1
  %scevgep140 = getelementptr [1200 x double], [1200 x double]* %4, i64 %36, i64 0
  %scevgep142 = getelementptr [1200 x double], [1200 x double]* %4, i64 %36, i64 %wide.trip.count
  %scevgep144 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep146 = getelementptr [1200 x double], [1200 x double]* %5, i64 %36, i64 %wide.trip.count
  %37 = add nsw i64 %indvars.iv34, -1
  br i1 %min.iters.check134, label %._crit_edge.preheader, label %min.iters.checked135

min.iters.checked135:                             ; preds = %.preheader6.us
  br i1 %cmp.zero138, label %._crit_edge.preheader, label %vector.memcheck152

vector.memcheck152:                               ; preds = %min.iters.checked135
  %bound0148 = icmp ult double* %scevgep140, %scevgep146
  %bound1149 = icmp ult double* %scevgep144, %scevgep142
  %memcheck.conflict151 = and i1 %bound0148, %bound1149
  br i1 %memcheck.conflict151, label %._crit_edge.preheader, label %vector.body131.preheader

vector.body131.preheader:                         ; preds = %vector.memcheck152
  br label %vector.body131

vector.body131:                                   ; preds = %vector.body131.preheader, %vector.body131
  %index154 = phi i64 [ %index.next155, %vector.body131 ], [ 0, %vector.body131.preheader ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %index154
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !12, !noalias !15
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !12, !noalias !15
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv34, i64 %index154
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !15
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load165 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !15
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %37, i64 %index154
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load166 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !15
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load167 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !15
  %50 = fsub <2 x double> %wide.load164, %wide.load166
  %51 = fsub <2 x double> %wide.load165, %wide.load167
  %52 = fmul <2 x double> %50, <double 5.000000e-01, double 5.000000e-01>
  %53 = fmul <2 x double> %51, <double 5.000000e-01, double 5.000000e-01>
  %54 = fsub <2 x double> %wide.load162, %52
  %55 = fsub <2 x double> %wide.load163, %53
  store <2 x double> %54, <2 x double>* %39, align 8, !alias.scope !12, !noalias !15
  store <2 x double> %55, <2 x double>* %41, align 8, !alias.scope !12, !noalias !15
  %index.next155 = add i64 %index154, 4
  %56 = icmp eq i64 %index.next155, %n.vec137
  br i1 %56, label %middle.block132, label %vector.body131, !llvm.loop !17

middle.block132:                                  ; preds = %vector.body131
  br i1 %cmp.n157, label %._crit_edge.us, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %middle.block132, %vector.memcheck152, %min.iters.checked135, %.preheader6.us
  %indvars.iv30.ph = phi i64 [ 0, %vector.memcheck152 ], [ 0, %min.iters.checked135 ], [ 0, %.preheader6.us ], [ %n.vec137, %middle.block132 ]
  %57 = sub nsw i64 %wide.trip.count, %indvars.iv30.ph
  %xtraiter194 = and i64 %57, 1
  %lcmp.mod195 = icmp eq i64 %xtraiter194, 0
  br i1 %lcmp.mod195, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %._crit_edge.preheader
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %indvars.iv30.ph
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv34, i64 %indvars.iv30.ph
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %37, i64 %indvars.iv30.ph
  %63 = load double, double* %62, align 8
  %64 = fsub double %61, %63
  %65 = fmul double %64, 5.000000e-01
  %66 = fsub double %59, %65
  store double %66, double* %58, align 8
  %indvars.iv.next31.prol = add nuw nsw i64 %indvars.iv30.ph, 1
  br label %._crit_edge.prol.loopexit.unr-lcssa

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %._crit_edge.preheader, %._crit_edge.prol
  %indvars.iv30.unr.ph = phi i64 [ %indvars.iv.next31.prol, %._crit_edge.prol ], [ %indvars.iv30.ph, %._crit_edge.preheader ]
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.unr-lcssa
  %67 = icmp eq i64 %15, %indvars.iv30.ph
  br i1 %67, label %._crit_edge.us.loopexit, label %._crit_edge.preheader.new

._crit_edge.preheader.new:                        ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader.new
  %indvars.iv30 = phi i64 [ %indvars.iv30.unr.ph, %._crit_edge.preheader.new ], [ %indvars.iv.next31.1, %._crit_edge ]
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %indvars.iv30
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv34, i64 %indvars.iv30
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %37, i64 %indvars.iv30
  %73 = load double, double* %72, align 8
  %74 = fsub double %71, %73
  %75 = fmul double %74, 5.000000e-01
  %76 = fsub double %69, %75
  store double %76, double* %68, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %indvars.iv.next31
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv34, i64 %indvars.iv.next31
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %37, i64 %indvars.iv.next31
  %82 = load double, double* %81, align 8
  %83 = fsub double %80, %82
  %84 = fmul double %83, 5.000000e-01
  %85 = fsub double %78, %84
  store double %85, double* %77, align 8
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next31.1, %wide.trip.count
  br i1 %exitcond33.1, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge, !llvm.loop !18

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block132
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %.preheader8.loopexit, label %.preheader6.us

._crit_edge60:                                    ; preds = %._crit_edge60, %._crit_edge60.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %._crit_edge60.preheader.new ], [ %indvars.iv.next.7, %._crit_edge60 ]
  %86 = load i64, i64* %21, align 8
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %88 = bitcast double* %87 to i64*
  store i64 %86, i64* %88, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %89 = load i64, i64* %21, align 8
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %91 = bitcast double* %90 to i64*
  store i64 %89, i64* %91, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %92 = load i64, i64* %21, align 8
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %94 = bitcast double* %93 to i64*
  store i64 %92, i64* %94, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %95 = load i64, i64* %21, align 8
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %97 = bitcast double* %96 to i64*
  store i64 %95, i64* %97, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %98 = load i64, i64* %21, align 8
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %100 = bitcast double* %99 to i64*
  store i64 %98, i64* %100, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %101 = load i64, i64* %21, align 8
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %103 = bitcast double* %102 to i64*
  store i64 %101, i64* %103, align 8
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %104 = load i64, i64* %21, align 8
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %106 = bitcast double* %105 to i64*
  store i64 %104, i64* %106, align 8
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %107 = load i64, i64* %21, align 8
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %109 = bitcast double* %108 to i64*
  store i64 %107, i64* %109, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count
  br i1 %exitcond.7, label %.preheader9.loopexit.unr-lcssa, label %._crit_edge60, !llvm.loop !19

.preheader8.loopexit:                             ; preds = %._crit_edge.us
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.loopexit, %.preheader9
  br i1 %brmerge66, label %.preheader7, label %.preheader5.us.preheader

.preheader5.us.preheader:                         ; preds = %.preheader8
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.preheader, %._crit_edge17.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge17.us ], [ 0, %.preheader5.us.preheader ]
  %scevgep103 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv43, i64 1
  %scevgep105 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv43, i64 %wide.trip.count
  %scevgep107 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv43, i64 0
  %scevgep109 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv43, i64 %wide.trip.count
  br i1 %min.iters.check97, label %._crit_edge61.preheader, label %min.iters.checked98

min.iters.checked98:                              ; preds = %.preheader5.us
  br i1 %cmp.zero101, label %._crit_edge61.preheader, label %vector.memcheck115

vector.memcheck115:                               ; preds = %min.iters.checked98
  %bound0111 = icmp ult double* %scevgep103, %scevgep109
  %bound1112 = icmp ult double* %scevgep107, %scevgep105
  %memcheck.conflict114 = and i1 %bound0111, %bound1112
  br i1 %memcheck.conflict114, label %._crit_edge61.preheader, label %vector.body94.preheader

vector.body94.preheader:                          ; preds = %vector.memcheck115
  br label %vector.body94

vector.body94:                                    ; preds = %vector.body94.preheader, %vector.body94
  %index117 = phi i64 [ %index.next118, %vector.body94 ], [ 0, %vector.body94.preheader ]
  %offset.idx = or i64 %index117, 1
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv43, i64 %offset.idx
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load125 = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !20, !noalias !23
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !20, !noalias !23
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv43, i64 %offset.idx
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !23
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !23
  %118 = add nsw i64 %offset.idx, -1
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv43, i64 %118
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !23
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !23
  %123 = fsub <2 x double> %wide.load127, %wide.load129
  %124 = fsub <2 x double> %wide.load128, %wide.load130
  %125 = fmul <2 x double> %123, <double 5.000000e-01, double 5.000000e-01>
  %126 = fmul <2 x double> %124, <double 5.000000e-01, double 5.000000e-01>
  %127 = fsub <2 x double> %wide.load125, %125
  %128 = fsub <2 x double> %wide.load126, %126
  store <2 x double> %127, <2 x double>* %111, align 8, !alias.scope !20, !noalias !23
  store <2 x double> %128, <2 x double>* %113, align 8, !alias.scope !20, !noalias !23
  %index.next118 = add i64 %index117, 4
  %129 = icmp eq i64 %index.next118, %n.vec100
  br i1 %129, label %middle.block95, label %vector.body94, !llvm.loop !25

middle.block95:                                   ; preds = %vector.body94
  br i1 %cmp.n120, label %._crit_edge17.us, label %._crit_edge61.preheader

._crit_edge61.preheader:                          ; preds = %middle.block95, %vector.memcheck115, %min.iters.checked98, %.preheader5.us
  %indvars.iv39.ph = phi i64 [ 1, %vector.memcheck115 ], [ 1, %min.iters.checked98 ], [ 1, %.preheader5.us ], [ %ind.end, %middle.block95 ]
  %130 = sub nsw i64 %wide.trip.count, %indvars.iv39.ph
  %xtraiter196 = and i64 %130, 1
  %lcmp.mod197 = icmp eq i64 %xtraiter196, 0
  br i1 %lcmp.mod197, label %._crit_edge61.prol.loopexit.unr-lcssa, label %._crit_edge61.prol.preheader

._crit_edge61.prol.preheader:                     ; preds = %._crit_edge61.preheader
  br label %._crit_edge61.prol

._crit_edge61.prol:                               ; preds = %._crit_edge61.prol.preheader
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv39.ph
  %132 = load double, double* %131, align 8
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv39.ph
  %134 = load double, double* %133, align 8
  %135 = add nsw i64 %indvars.iv39.ph, -1
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv43, i64 %135
  %137 = load double, double* %136, align 8
  %138 = fsub double %134, %137
  %139 = fmul double %138, 5.000000e-01
  %140 = fsub double %132, %139
  store double %140, double* %131, align 8
  %indvars.iv.next40.prol = add nuw nsw i64 %indvars.iv39.ph, 1
  br label %._crit_edge61.prol.loopexit.unr-lcssa

._crit_edge61.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge61.preheader, %._crit_edge61.prol
  %indvars.iv39.unr.ph = phi i64 [ %indvars.iv.next40.prol, %._crit_edge61.prol ], [ %indvars.iv39.ph, %._crit_edge61.preheader ]
  br label %._crit_edge61.prol.loopexit

._crit_edge61.prol.loopexit:                      ; preds = %._crit_edge61.prol.loopexit.unr-lcssa
  %141 = icmp eq i64 %16, %indvars.iv39.ph
  br i1 %141, label %._crit_edge17.us.loopexit, label %._crit_edge61.preheader.new

._crit_edge61.preheader.new:                      ; preds = %._crit_edge61.prol.loopexit
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge61, %._crit_edge61.preheader.new
  %indvars.iv39 = phi i64 [ %indvars.iv39.unr.ph, %._crit_edge61.preheader.new ], [ %indvars.iv.next40.1, %._crit_edge61 ]
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv39
  %143 = load double, double* %142, align 8
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv39
  %145 = load double, double* %144, align 8
  %146 = add nsw i64 %indvars.iv39, -1
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv43, i64 %146
  %148 = load double, double* %147, align 8
  %149 = fsub double %145, %148
  %150 = fmul double %149, 5.000000e-01
  %151 = fsub double %143, %150
  store double %151, double* %142, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv.next40
  %153 = load double, double* %152, align 8
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv.next40
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv39
  %157 = load double, double* %156, align 8
  %158 = fsub double %155, %157
  %159 = fmul double %158, 5.000000e-01
  %160 = fsub double %153, %159
  store double %160, double* %152, align 8
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, 2
  %exitcond42.1 = icmp eq i64 %indvars.iv.next40.1, %wide.trip.count
  br i1 %exitcond42.1, label %._crit_edge17.us.loopexit.unr-lcssa, label %._crit_edge61, !llvm.loop !26

._crit_edge17.us.loopexit.unr-lcssa:              ; preds = %._crit_edge61
  br label %._crit_edge17.us.loopexit

._crit_edge17.us.loopexit:                        ; preds = %._crit_edge61.prol.loopexit, %._crit_edge17.us.loopexit.unr-lcssa
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %middle.block95
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count36
  br i1 %exitcond46, label %.preheader7.loopexit, label %.preheader5.us

.preheader7.loopexit:                             ; preds = %._crit_edge17.us
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader8
  br i1 %brmerge69, label %._crit_edge23, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader7
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge21.us
  %indvars.iv52 = phi i64 [ %161, %._crit_edge21.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv52, i64 0
  %scevgep71 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv52, i64 %wide.trip.count50
  %scevgep73 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv52, i64 0
  %scevgep75 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv52, i64 %12
  %scevgep77 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 0
  %161 = add nuw nsw i64 %indvars.iv52, 1
  %scevgep79 = getelementptr [1200 x double], [1200 x double]* %4, i64 %161, i64 %wide.trip.count50
  br i1 %min.iters.check, label %._crit_edge62.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %._crit_edge62.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep75
  %bound1 = icmp ult double* %scevgep73, %scevgep71
  %found.conflict = and i1 %bound0, %bound1
  %bound081 = icmp ult double* %scevgep, %scevgep79
  %bound182 = icmp ult double* %scevgep77, %scevgep71
  %found.conflict83 = and i1 %bound081, %bound182
  %conflict.rdx = or i1 %found.conflict, %found.conflict83
  br i1 %conflict.rdx, label %._crit_edge62.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv52, i64 %index
  %163 = bitcast double* %162 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %163, align 8, !alias.scope !27, !noalias !30
  %164 = getelementptr double, double* %162, i64 2
  %165 = bitcast double* %164 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %165, align 8, !alias.scope !27, !noalias !30
  %166 = or i64 %index, 1
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv52, i64 %166
  %168 = bitcast double* %167 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %168, align 8, !alias.scope !33
  %169 = getelementptr double, double* %167, i64 2
  %170 = bitcast double* %169 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %170, align 8, !alias.scope !33
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv52, i64 %index
  %172 = bitcast double* %171 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %172, align 8, !alias.scope !33
  %173 = getelementptr double, double* %171, i64 2
  %174 = bitcast double* %173 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %174, align 8, !alias.scope !33
  %175 = fsub <2 x double> %wide.load86, %wide.load88
  %176 = fsub <2 x double> %wide.load87, %wide.load89
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %161, i64 %index
  %178 = bitcast double* %177 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %178, align 8, !alias.scope !34
  %179 = getelementptr double, double* %177, i64 2
  %180 = bitcast double* %179 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %180, align 8, !alias.scope !34
  %181 = fadd <2 x double> %175, %wide.load90
  %182 = fadd <2 x double> %176, %wide.load91
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %index
  %184 = bitcast double* %183 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %184, align 8, !alias.scope !34
  %185 = getelementptr double, double* %183, i64 2
  %186 = bitcast double* %185 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %186, align 8, !alias.scope !34
  %187 = fsub <2 x double> %181, %wide.load92
  %188 = fsub <2 x double> %182, %wide.load93
  %189 = fmul <2 x double> %187, <double 7.000000e-01, double 7.000000e-01>
  %190 = fmul <2 x double> %188, <double 7.000000e-01, double 7.000000e-01>
  %191 = fsub <2 x double> %wide.load, %189
  %192 = fsub <2 x double> %wide.load85, %190
  store <2 x double> %191, <2 x double>* %163, align 8, !alias.scope !27, !noalias !30
  store <2 x double> %192, <2 x double>* %165, align 8, !alias.scope !27, !noalias !30
  %index.next = add i64 %index, 4
  %193 = icmp eq i64 %index.next, %n.vec
  br i1 %193, label %middle.block, label %vector.body, !llvm.loop !35

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge21.us, label %._crit_edge62.preheader

._crit_edge62.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv48.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us ], [ %n.vec, %middle.block ]
  br label %._crit_edge62

._crit_edge62:                                    ; preds = %._crit_edge62.preheader, %._crit_edge62
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge62 ], [ %indvars.iv48.ph, %._crit_edge62.preheader ]
  %194 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv52, i64 %indvars.iv48
  %195 = load double, double* %194, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %196 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv52, i64 %indvars.iv.next49
  %197 = load double, double* %196, align 8
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv52, i64 %indvars.iv48
  %199 = load double, double* %198, align 8
  %200 = fsub double %197, %199
  %201 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %161, i64 %indvars.iv48
  %202 = load double, double* %201, align 8
  %203 = fadd double %200, %202
  %204 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv48
  %205 = load double, double* %204, align 8
  %206 = fsub double %203, %205
  %207 = fmul double %206, 7.000000e-01
  %208 = fsub double %195, %207
  store double %208, double* %194, align 8
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond51, label %._crit_edge21.us.loopexit, label %._crit_edge62, !llvm.loop !36

._crit_edge21.us.loopexit:                        ; preds = %._crit_edge62
  br label %._crit_edge21.us

._crit_edge21.us:                                 ; preds = %._crit_edge21.us.loopexit, %middle.block
  %exitcond55 = icmp eq i64 %161, %wide.trip.count54
  br i1 %exitcond55, label %._crit_edge23.loopexit, label %.preheader.us

._crit_edge23.loopexit:                           ; preds = %._crit_edge21.us
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %.preheader7
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, %wide.trip.count58
  br i1 %exitcond59, label %._crit_edge25.loopexit, label %.preheader10

._crit_edge25.loopexit:                           ; preds = %._crit_edge23
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = icmp sgt i32 %0, 0
  %11 = icmp sgt i32 %1, 0
  %or.cond = and i1 %10, %11
  br i1 %or.cond, label %.preheader11.us.preheader, label %._crit_edge24

.preheader11.us.preheader:                        ; preds = %5
  %12 = sext i32 %0 to i64
  %wide.trip.count44 = zext i32 %1 to i64
  %wide.trip.count48 = zext i32 %0 to i64
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge22.us, %.preheader11.us.preheader
  %indvars.iv46 = phi i64 [ 0, %.preheader11.us.preheader ], [ %indvars.iv.next47, %._crit_edge22.us ]
  %13 = mul nsw i64 %indvars.iv46, %12
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge, %.preheader11.us
  %indvars.iv42 = phi i64 [ 0, %.preheader11.us ], [ %indvars.iv.next43, %._crit_edge ]
  %14 = add nsw i64 %indvars.iv42, %13
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %._crit_edge51
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc9.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge51, %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %indvars.iv42
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, %wide.trip.count44
  br i1 %exitcond45, label %._crit_edge22.us, label %._crit_edge51

._crit_edge22.us:                                 ; preds = %._crit_edge
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %._crit_edge24.loopexit, label %.preheader11.us

._crit_edge24.loopexit:                           ; preds = %._crit_edge22.us
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br i1 %or.cond, label %.preheader10.us.preheader, label %._crit_edge19

.preheader10.us.preheader:                        ; preds = %._crit_edge24
  %30 = sext i32 %0 to i64
  %wide.trip.count35 = zext i32 %1 to i64
  %wide.trip.count39 = zext i32 %0 to i64
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge17.us, %.preheader10.us.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next38, %._crit_edge17.us ]
  %31 = mul nsw i64 %indvars.iv37, %30
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge52, %.preheader10.us
  %indvars.iv33 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next34, %._crit_edge52 ]
  %32 = add nsw i64 %indvars.iv33, %31
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 20
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %._crit_edge52

; <label>:36:                                     ; preds = %._crit_edge53
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %37) #5
  br label %._crit_edge52

._crit_edge52:                                    ; preds = %._crit_edge53, %36
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv33
  %40 = load double, double* %39, align 8
  %41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %40) #6
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %._crit_edge17.us, label %._crit_edge53

._crit_edge17.us:                                 ; preds = %._crit_edge52
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count39
  br i1 %exitcond40, label %._crit_edge19.loopexit, label %.preheader10.us

._crit_edge19.loopexit:                           ; preds = %._crit_edge17.us
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %._crit_edge24
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %._crit_edge19
  %46 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count30 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv28 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next29, %._crit_edge.us ]
  %47 = mul nsw i64 %indvars.iv28, %46
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge54, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge54 ]
  %48 = add nsw i64 %indvars.iv, %47
  %49 = trunc i64 %48 to i32
  %50 = srem i32 %49, 20
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %._crit_edge54

; <label>:52:                                     ; preds = %._crit_edge55
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %53) #5
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge55, %52
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %56) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge55

._crit_edge.us:                                   ; preds = %._crit_edge54
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond31, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %._crit_edge19
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %59 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %58, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !10, !11}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !10, !11}
!26 = distinct !{!26, !10, !11}
!27 = !{!28}
!28 = distinct !{!28, !29}
!29 = distinct !{!29, !"LVerDomain"}
!30 = !{!31, !32}
!31 = distinct !{!31, !29}
!32 = distinct !{!32, !29}
!33 = !{!31}
!34 = !{!32}
!35 = distinct !{!35, !10, !11}
!36 = distinct !{!36, !10, !11}
