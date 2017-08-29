; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader19.lr.ph, label %._crit_edge26

.preheader19.lr.ph:                               ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = and i32 %0, 1
  %wide.trip.count39 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %wide.trip.count43 = zext i32 %0 to i64
  %7 = icmp eq i32 %6, 0
  %8 = icmp eq i32 %0, 1
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge23.us, %.preheader19.lr.ph
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge23.us ], [ 0, %.preheader19.lr.ph ]
  %9 = trunc i64 %indvars.iv41 to i32
  %10 = add i32 %9, %0
  br label %.preheader.us.us

._crit_edge23.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond44, label %._crit_edge26.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next38, %._crit_edge.us.us ]
  %11 = trunc i64 %indvars.iv37 to i32
  %12 = add i32 %10, %11
  br i1 %7, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %13 = sitofp i32 %12 to double
  %14 = fmul double %13, 1.000000e+01
  %15 = fdiv double %14, %5
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv37, i64 0
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv37, i64 0
  store double %15, double* %17, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %8, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count39
  br i1 %exitcond40, label %._crit_edge23.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %18 = trunc i64 %indvars.iv to i32
  %19 = sub i32 %12, %18
  %20 = sitofp i32 %19 to double
  %21 = fmul double %20, 1.000000e+01
  %22 = fdiv double %21, %5
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv37, i64 %indvars.iv
  store double %22, double* %23, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv37, i64 %indvars.iv
  store double %22, double* %24, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = trunc i64 %indvars.iv.next to i32
  %26 = sub i32 %12, %25
  %27 = sitofp i32 %26 to double
  %28 = fmul double %27, 1.000000e+01
  %29 = fdiv double %28, %5
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv37, i64 %indvars.iv.next
  store double %29, double* %30, align 8
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv37, i64 %indvars.iv.next
  store double %29, double* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge26.loopexit:                           ; preds = %._crit_edge23.us
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = add nsw i32 %0, -1
  %wide.trip.count3 = zext i32 %4 to i64
  %wide.trip.count = zext i32 %4 to i64
  %wide.trip.count7 = zext i32 %4 to i64
  %wide.trip.count15 = zext i32 %4 to i64
  %wide.trip.count11 = zext i32 %4 to i64
  %wide.trip.count19 = zext i32 %4 to i64
  %5 = add nsw i64 %wide.trip.count11, -1
  %6 = icmp sgt i32 %4, 1
  %7 = icmp sgt i32 %4, 1
  %min.iters.check41 = icmp ult i64 %5, 2
  %n.vec44 = and i64 %5, -2
  %cmp.zero45 = icmp eq i64 %n.vec44, 0
  %ind.end68 = or i64 %5, 1
  %cmp.n69 = icmp eq i64 %5, %n.vec44
  %8 = icmp sgt i32 %4, 1
  %min.iters.check = icmp ult i64 %5, 2
  %n.vec = and i64 %5, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %5, 1
  %cmp.n = icmp eq i64 %5, %n.vec
  br label %.preheader110

.preheader110:                                    ; preds = %._crit_edge121, %3
  %storemerge122 = phi i32 [ 1, %3 ], [ %143, %._crit_edge121 ]
  br i1 %6, label %.preheader108.preheader, label %._crit_edge121

.preheader108.preheader:                          ; preds = %.preheader110
  br label %.preheader108

.preheader109:                                    ; preds = %._crit_edge113
  br i1 %8, label %.preheader.lr.ph.preheader, label %._crit_edge121

.preheader.lr.ph.preheader:                       ; preds = %.preheader109
  br label %.preheader.lr.ph

.preheader108:                                    ; preds = %.preheader108.preheader, %._crit_edge113
  %indvar47 = phi i64 [ %indvar.next48, %._crit_edge113 ], [ 0, %.preheader108.preheader ]
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge113 ], [ 1, %.preheader108.preheader ]
  %9 = add i64 %indvar47, 1
  %10 = add i64 %indvar47, 2
  br i1 %7, label %.preheader106.lr.ph, label %._crit_edge113

.preheader106.lr.ph:                              ; preds = %.preheader108
  %11 = add nuw nsw i64 %indvars.iv5, 1
  %12 = add nsw i64 %indvars.iv5, -1
  br label %.preheader106.us

.preheader106.us:                                 ; preds = %._crit_edge.us, %.preheader106.lr.ph
  %indvar49 = phi i64 [ %indvar.next50, %._crit_edge.us ], [ 0, %.preheader106.lr.ph ]
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge.us ], [ 1, %.preheader106.lr.ph ]
  %13 = add i64 %indvar49, 1
  %scevgep51 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %9, i64 %13, i64 1
  %scevgep53 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %9, i64 %13, i64 %wide.trip.count11
  %scevgep55 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar47, i64 %13, i64 1
  %scevgep57 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %10, i64 %13, i64 %wide.trip.count11
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %14 = add nsw i64 %indvars.iv1, -1
  br i1 %min.iters.check41, label %scalar.ph40.preheader, label %min.iters.checked42

min.iters.checked42:                              ; preds = %.preheader106.us
  br i1 %cmp.zero45, label %scalar.ph40.preheader, label %vector.memcheck63

vector.memcheck63:                                ; preds = %min.iters.checked42
  %bound059 = icmp ult double* %scevgep51, %scevgep57
  %bound160 = icmp ult double* %scevgep55, %scevgep53
  %memcheck.conflict62 = and i1 %bound059, %bound160
  br i1 %memcheck.conflict62, label %scalar.ph40.preheader, label %vector.body38.preheader

vector.body38.preheader:                          ; preds = %vector.memcheck63
  br label %vector.body38

vector.body38:                                    ; preds = %vector.body38.preheader, %vector.body38
  %index65 = phi i64 [ %index.next66, %vector.body38 ], [ 0, %vector.body38.preheader ]
  %offset.idx70 = or i64 %index65, 1
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %11, i64 %indvars.iv1, i64 %offset.idx70
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv5, i64 %indvars.iv1, i64 %offset.idx70
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = fmul <2 x double> %wide.load75, <double 2.000000e+00, double 2.000000e+00>
  %20 = fsub <2 x double> %wide.load74, %19
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %12, i64 %indvars.iv1, i64 %offset.idx70
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %wide.load76, %20
  %24 = fmul <2 x double> %23, <double 1.250000e-01, double 1.250000e-01>
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv5, i64 %indvars.iv.next2, i64 %offset.idx70
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fsub <2 x double> %wide.load77, %19
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv5, i64 %14, i64 %offset.idx70
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %27, %wide.load78
  %31 = fmul <2 x double> %30, <double 1.250000e-01, double 1.250000e-01>
  %32 = fadd <2 x double> %24, %31
  %33 = add nuw nsw i64 %offset.idx70, 1
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv5, i64 %indvars.iv1, i64 %33
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = fsub <2 x double> %wide.load79, %19
  %37 = add nsw i64 %offset.idx70, -1
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv5, i64 %indvars.iv1, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !1
  %40 = fadd <2 x double> %36, %wide.load80
  %41 = fmul <2 x double> %40, <double 1.250000e-01, double 1.250000e-01>
  %42 = fadd <2 x double> %32, %41
  %43 = fadd <2 x double> %wide.load75, %42
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv5, i64 %indvars.iv1, i64 %offset.idx70
  %45 = bitcast double* %44 to <2 x double>*
  store <2 x double> %43, <2 x double>* %45, align 8, !alias.scope !4, !noalias !1
  %index.next66 = add i64 %index65, 2
  %46 = icmp eq i64 %index.next66, %n.vec44
  br i1 %46, label %middle.block39, label %vector.body38, !llvm.loop !6

middle.block39:                                   ; preds = %vector.body38
  br i1 %cmp.n69, label %._crit_edge.us, label %scalar.ph40.preheader

scalar.ph40.preheader:                            ; preds = %middle.block39, %vector.memcheck63, %min.iters.checked42, %.preheader106.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck63 ], [ 1, %min.iters.checked42 ], [ 1, %.preheader106.us ], [ %ind.end68, %middle.block39 ]
  br label %scalar.ph40

scalar.ph40:                                      ; preds = %scalar.ph40.preheader, %scalar.ph40
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph40 ], [ %indvars.iv.ph, %scalar.ph40.preheader ]
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %11, i64 %indvars.iv1, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv5, i64 %indvars.iv1, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, 2.000000e+00
  %52 = fsub double %48, %51
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %12, i64 %indvars.iv1, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  %56 = fmul double %55, 1.250000e-01
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv5, i64 %indvars.iv.next2, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = fsub double %58, %51
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv5, i64 %14, i64 %indvars.iv
  %61 = load double, double* %60, align 8
  %62 = fadd double %59, %61
  %63 = fmul double %62, 1.250000e-01
  %64 = fadd double %56, %63
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv5, i64 %indvars.iv1, i64 %indvars.iv.next
  %66 = load double, double* %65, align 8
  %67 = fsub double %66, %51
  %68 = add nsw i64 %indvars.iv, -1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv5, i64 %indvars.iv1, i64 %68
  %70 = load double, double* %69, align 8
  %71 = fadd double %67, %70
  %72 = fmul double %71, 1.250000e-01
  %73 = fadd double %64, %72
  %74 = fadd double %50, %73
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv5, i64 %indvars.iv1, i64 %indvars.iv
  store double %74, double* %75, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph40, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph40
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block39
  %exitcond4 = icmp eq i64 %indvars.iv.next2, %wide.trip.count3
  %indvar.next50 = add i64 %indvar49, 1
  br i1 %exitcond4, label %._crit_edge113.loopexit, label %.preheader106.us

._crit_edge113.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113.loopexit, %.preheader108
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  %indvar.next48 = add i64 %indvar47, 1
  br i1 %exitcond8, label %.preheader109, label %.preheader108

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge119
  %indvar = phi i64 [ %indvar.next, %._crit_edge119 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge119 ], [ 1, %.preheader.lr.ph.preheader ]
  %76 = add i64 %indvar, 1
  %77 = add i64 %indvar, 2
  %78 = add nuw nsw i64 %indvars.iv17, 1
  %79 = add nsw i64 %indvars.iv17, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge117.us, %.preheader.lr.ph
  %indvar23 = phi i64 [ %indvar.next24, %._crit_edge117.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge117.us ], [ 1, %.preheader.lr.ph ]
  %80 = add i64 %indvar23, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %76, i64 %80, i64 1
  %scevgep26 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %76, i64 %80, i64 %wide.trip.count11
  %scevgep28 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %80, i64 1
  %scevgep30 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %77, i64 %80, i64 %wide.trip.count11
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %81 = add nsw i64 %indvars.iv13, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep30
  %bound1 = icmp ult double* %scevgep28, %scevgep26
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %78, i64 %indvars.iv13, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv17, i64 %indvars.iv13, i64 %offset.idx
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load32 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !10
  %86 = fmul <2 x double> %wide.load32, <double 2.000000e+00, double 2.000000e+00>
  %87 = fsub <2 x double> %wide.load, %86
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %79, i64 %indvars.iv13, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = fadd <2 x double> %wide.load33, %87
  %91 = fmul <2 x double> %90, <double 1.250000e-01, double 1.250000e-01>
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv17, i64 %indvars.iv.next14, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !10
  %94 = fsub <2 x double> %wide.load34, %86
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv17, i64 %81, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !10
  %97 = fadd <2 x double> %94, %wide.load35
  %98 = fmul <2 x double> %97, <double 1.250000e-01, double 1.250000e-01>
  %99 = fadd <2 x double> %91, %98
  %100 = add nuw nsw i64 %offset.idx, 1
  %101 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv17, i64 %indvars.iv13, i64 %100
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !10
  %103 = fsub <2 x double> %wide.load36, %86
  %104 = add nsw i64 %offset.idx, -1
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv17, i64 %indvars.iv13, i64 %104
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !10
  %107 = fadd <2 x double> %103, %wide.load37
  %108 = fmul <2 x double> %107, <double 1.250000e-01, double 1.250000e-01>
  %109 = fadd <2 x double> %99, %108
  %110 = fadd <2 x double> %wide.load32, %109
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv17, i64 %indvars.iv13, i64 %offset.idx
  %112 = bitcast double* %111 to <2 x double>*
  store <2 x double> %110, <2 x double>* %112, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %113 = icmp eq i64 %index.next, %n.vec
  br i1 %113, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge117.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv9.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %scalar.ph ], [ %indvars.iv9.ph, %scalar.ph.preheader ]
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %78, i64 %indvars.iv13, i64 %indvars.iv9
  %115 = load double, double* %114, align 8
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv17, i64 %indvars.iv13, i64 %indvars.iv9
  %117 = load double, double* %116, align 8
  %118 = fmul double %117, 2.000000e+00
  %119 = fsub double %115, %118
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %79, i64 %indvars.iv13, i64 %indvars.iv9
  %121 = load double, double* %120, align 8
  %122 = fadd double %121, %119
  %123 = fmul double %122, 1.250000e-01
  %124 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv17, i64 %indvars.iv.next14, i64 %indvars.iv9
  %125 = load double, double* %124, align 8
  %126 = fsub double %125, %118
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv17, i64 %81, i64 %indvars.iv9
  %128 = load double, double* %127, align 8
  %129 = fadd double %126, %128
  %130 = fmul double %129, 1.250000e-01
  %131 = fadd double %123, %130
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv17, i64 %indvars.iv13, i64 %indvars.iv.next10
  %133 = load double, double* %132, align 8
  %134 = fsub double %133, %118
  %135 = add nsw i64 %indvars.iv9, -1
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv17, i64 %indvars.iv13, i64 %135
  %137 = load double, double* %136, align 8
  %138 = fadd double %134, %137
  %139 = fmul double %138, 1.250000e-01
  %140 = fadd double %131, %139
  %141 = fadd double %117, %140
  %142 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv17, i64 %indvars.iv13, i64 %indvars.iv9
  store double %141, double* %142, align 8
  %exitcond12 = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  br i1 %exitcond12, label %._crit_edge117.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge117.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge117.us

._crit_edge117.us:                                ; preds = %._crit_edge117.us.loopexit, %middle.block
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count15
  %indvar.next24 = add i64 %indvar23, 1
  br i1 %exitcond16, label %._crit_edge119, label %.preheader.us

._crit_edge119:                                   ; preds = %._crit_edge117.us
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, %wide.trip.count19
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond20, label %._crit_edge121.loopexit, label %.preheader.lr.ph

._crit_edge121.loopexit:                          ; preds = %._crit_edge119
  br label %._crit_edge121

._crit_edge121:                                   ; preds = %._crit_edge121.loopexit, %.preheader109, %.preheader110
  %143 = add nuw nsw i32 %storemerge122, 1
  %exitcond21 = icmp eq i32 %143, 501
  br i1 %exitcond21, label %144, label %.preheader110

; <label>:144:                                    ; preds = %._crit_edge121
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader15.lr.ph, label %._crit_edge22

.preheader15.lr.ph:                               ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count35 = zext i32 %0 to i64
  %wide.trip.count39 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge19.us, %.preheader15.lr.ph
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge19.us ], [ 0, %.preheader15.lr.ph ]
  %9 = mul nsw i64 %indvars.iv37, %8
  %10 = trunc i64 %9 to i32
  br label %.preheader.us.us

._crit_edge19.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count39
  br i1 %exitcond40, label %._crit_edge22.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next34, %._crit_edge.us.us ]
  %11 = trunc i64 %indvars.iv33 to i32
  %12 = add i32 %11, %10
  %13 = mul i32 %12, %0
  %14 = zext i32 %13 to i64
  br label %15

._crit_edge.us.us:                                ; preds = %._crit_edge
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %._crit_edge19.us, label %.preheader.us.us

; <label>:15:                                     ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.preheader.us.us ]
  %16 = add i64 %indvars.iv, %14
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %15
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %15, %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %15

._crit_edge22.loopexit:                           ; preds = %._crit_edge19.us
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %2
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
