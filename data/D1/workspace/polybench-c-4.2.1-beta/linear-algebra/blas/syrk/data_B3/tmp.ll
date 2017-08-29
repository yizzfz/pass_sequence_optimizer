; ModuleID = 'A.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = bitcast i8* %5 to [1200 x double]*
  %8 = bitcast i8* %6 to [1000 x double]*
  call void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  call void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %7, [1000 x double]* %8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  call void @print_array(i32 1200, [1200 x double]* %7)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*) #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader28.lr.ph, label %._crit_edge32

.preheader28.lr.ph:                               ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = sitofp i32 %0 to double
  br i1 %8, label %.preheader28.us.preheader, label %.preheader28.lr.ph..preheader.lr.ph_crit_edge

.preheader28.lr.ph..preheader.lr.ph_crit_edge:    ; preds = %.preheader28.lr.ph
  %.pre = zext i32 %0 to i64
  br label %.preheader.lr.ph

.preheader28.us.preheader:                        ; preds = %.preheader28.lr.ph
  %wide.trip.count45 = zext i32 %1 to i64
  %wide.trip.count49 = zext i32 %0 to i64
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %.preheader28.us.preheader, %._crit_edge35.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge35.us ], [ 0, %.preheader28.us.preheader ]
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader28.us
  %indvars.iv43 = phi i64 [ 0, %.preheader28.us ], [ %indvars.iv.next44, %10 ]
  %11 = mul nuw nsw i64 %indvars.iv43, %indvars.iv47
  %12 = add nuw nsw i64 %11, 1
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, %0
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %9
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv47, i64 %indvars.iv43
  store double %16, double* %17, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %._crit_edge35.us, label %10

._crit_edge35.us:                                 ; preds = %10
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond50, label %.preheader.lr.ph.loopexit, label %.preheader28.us

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge35.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader28.lr.ph..preheader.lr.ph_crit_edge
  %wide.trip.count.pre-phi = phi i64 [ %.pre, %.preheader28.lr.ph..preheader.lr.ph_crit_edge ], [ %wide.trip.count49, %.preheader.lr.ph.loopexit ]
  %18 = sitofp i32 %1 to double
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br label %19

; <label>:19:                                     ; preds = %19, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %19 ]
  %20 = mul nuw nsw i64 %indvars.iv, %indvars.iv39
  %21 = add nuw nsw i64 %20, 2
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, %1
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %18
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv
  store double %25, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count.pre-phi
  br i1 %exitcond, label %._crit_edge.us, label %19

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count.pre-phi
  br i1 %exitcond42, label %._crit_edge32.loopexit, label %.preheader.us

._crit_edge32.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %6
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syrk(i32, i32, double, double, [1200 x double]*, [1000 x double]*) #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader28.lr.ph, label %._crit_edge37

.preheader28.lr.ph:                               ; preds = %6
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader28.lr.ph
  %wide.trip.count75 = zext i32 %0 to i64
  %broadcast.splatinsert91 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat92 = shufflevector <2 x double> %broadcast.splatinsert91, <2 x double> undef, <2 x i32> zeroinitializer
  %9 = insertelement <2 x double> undef, double %3, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  %11 = insertelement <2 x double> undef, double %3, i32 0
  %12 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader28.lr.ph
  %wide.trip.count57 = zext i32 %1 to i64
  %wide.trip.count64 = zext i32 %0 to i64
  %broadcast.splatinsert116 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat117 = shufflevector <2 x double> %broadcast.splatinsert116, <2 x double> undef, <2 x i32> zeroinitializer
  %13 = insertelement <2 x double> undef, double %3, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = insertelement <2 x double> undef, double %3, i32 0
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader119, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader119 ]
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv
  %18 = bitcast double* %17 to <2 x double>*
  %19 = load <2 x double>, <2 x double>* %18, align 8
  %20 = fmul <2 x double> %19, %14
  %21 = bitcast double* %17 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv.next.1
  %23 = bitcast double* %22 to <2 x double>*
  %24 = load <2 x double>, <2 x double>* %23, align 8
  %25 = fmul <2 x double> %24, %16
  %26 = bitcast double* %22 to <2 x double>*
  store <2 x double> %25, <2 x double>* %26, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv60
  br i1 %exitcond.3, label %.preheader.us39.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us39.new:                              ; preds = %.preheader.us39.new.preheader, %.preheader.us39.new
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %.preheader.us39.new ], [ %indvars.iv49.unr.ph, %.preheader.us39.new.preheader ]
  %27 = load double, double* %43, align 8
  %28 = fmul double %27, %2
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv55
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv49
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %32, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %35 = load double, double* %43, align 8
  %36 = fmul double %35, %2
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next50, i64 %indvars.iv55
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv.next50
  %41 = load double, double* %40, align 8
  %42 = fadd double %41, %39
  store double %42, double* %40, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next50.1, %indvars.iv60
  br i1 %exitcond54.1, label %._crit_edge.us42.loopexit, label %.preheader.us39.new

.preheader.us39:                                  ; preds = %.preheader.us39.preheader, %._crit_edge.us42
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge.us42 ], [ 0, %.preheader.us39.preheader ]
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv55
  br i1 %lcmp.mod80, label %.prol.preheader77, label %.prol.loopexit78

.prol.preheader77:                                ; preds = %.preheader.us39
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %2
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv55
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = load double, double* %80, align 8
  %50 = fadd double %49, %48
  store double %50, double* %80, align 8
  br label %.prol.loopexit78

.prol.loopexit78:                                 ; preds = %.prol.preheader77, %.preheader.us39
  %indvars.iv49.unr.ph = phi i64 [ 1, %.prol.preheader77 ], [ 0, %.preheader.us39 ]
  br i1 %81, label %._crit_edge.us42, label %.preheader.us39.new.preheader

.preheader.us39.new.preheader:                    ; preds = %.prol.loopexit78
  br label %.preheader.us39.new

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge33.us
  %indvars.iv62 = phi i64 [ %52, %._crit_edge33.us ], [ 0, %.lr.ph.us.preheader ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge33.us ], [ 1, %.lr.ph.us.preheader ]
  %51 = add i64 %indvars.iv62, -3
  %52 = add i64 %indvars.iv62, 1
  %xtraiter = and i64 %52, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv.prol
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %3
  store double %55, double* %53, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !5

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %56 = icmp ult i64 %indvars.iv62, 3
  br i1 %56, label %.preheader.us39.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %57 = sub i64 %51, %indvars.iv.unr
  %58 = lshr i64 %57, 2
  %59 = add nuw nsw i64 %58, 1
  %min.iters.check96 = icmp ult i64 %59, 2
  br i1 %min.iters.check96, label %.lr.ph.us.new.preheader119, label %min.iters.checked97

.lr.ph.us.new.preheader119:                       ; preds = %middle.block94, %min.iters.checked97, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked97 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end105, %middle.block94 ]
  br label %.lr.ph.us.new

min.iters.checked97:                              ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf98 = and i64 %59, 1
  %n.vec99 = sub nsw i64 %59, %n.mod.vf98
  %cmp.zero100 = icmp eq i64 %n.vec99, 0
  %60 = add i64 %indvars.iv.unr, 4
  %61 = shl nuw i64 %58, 2
  %62 = add i64 %60, %61
  %63 = shl nuw nsw i64 %n.mod.vf98, 2
  %ind.end105 = sub i64 %62, %63
  br i1 %cmp.zero100, label %.lr.ph.us.new.preheader119, label %vector.ph101

vector.ph101:                                     ; preds = %min.iters.checked97
  br label %vector.body93

vector.body93:                                    ; preds = %vector.body93, %vector.ph101
  %index102 = phi i64 [ 0, %vector.ph101 ], [ %index.next103, %vector.body93 ]
  %64 = shl i64 %index102, 2
  %65 = add i64 %indvars.iv.unr, %64
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %65
  %67 = bitcast double* %66 to <8 x double>*
  %wide.vec111 = load <8 x double>, <8 x double>* %67, align 8
  %strided.vec112 = shufflevector <8 x double> %wide.vec111, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec113 = shufflevector <8 x double> %wide.vec111, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec114 = shufflevector <8 x double> %wide.vec111, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec115 = shufflevector <8 x double> %wide.vec111, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %68 = fmul <2 x double> %strided.vec112, %broadcast.splat117
  %69 = fmul <2 x double> %strided.vec113, %broadcast.splat117
  %70 = fmul <2 x double> %strided.vec114, %broadcast.splat117
  %71 = add nsw i64 %65, 3
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %71
  %73 = fmul <2 x double> %strided.vec115, %broadcast.splat117
  %74 = getelementptr double, double* %72, i64 -3
  %75 = bitcast double* %74 to <8 x double>*
  %76 = shufflevector <2 x double> %68, <2 x double> %69, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %77 = shufflevector <2 x double> %70, <2 x double> %73, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec118 = shufflevector <4 x double> %76, <4 x double> %77, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec118, <8 x double>* %75, align 8
  %index.next103 = add i64 %index102, 2
  %78 = icmp eq i64 %index.next103, %n.vec99
  br i1 %78, label %middle.block94, label %vector.body93, !llvm.loop !7

middle.block94:                                   ; preds = %vector.body93
  %cmp.n106 = icmp eq i64 %n.mod.vf98, 0
  br i1 %cmp.n106, label %.preheader.us39.preheader, label %.lr.ph.us.new.preheader119

.preheader.us39.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us39.preheader

.preheader.us39.preheader:                        ; preds = %.preheader.us39.preheader.loopexit, %middle.block94, %.prol.loopexit
  %79 = and i64 %indvars.iv62, 1
  %lcmp.mod80 = icmp eq i64 %79, 0
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 0
  %81 = icmp eq i64 %indvars.iv62, 0
  br label %.preheader.us39

._crit_edge.us42.loopexit:                        ; preds = %.preheader.us39.new
  br label %._crit_edge.us42

._crit_edge.us42:                                 ; preds = %._crit_edge.us42.loopexit, %.prol.loopexit78
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, %wide.trip.count57
  br i1 %exitcond58, label %._crit_edge33.us, label %.preheader.us39

._crit_edge33.us:                                 ; preds = %._crit_edge.us42
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond65 = icmp eq i64 %52, %wide.trip.count64
  br i1 %exitcond65, label %._crit_edge37.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.preheader27
  %indvars.iv73 = phi i64 [ %83, %.preheader27 ], [ 0, %.lr.ph.preheader ]
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %.preheader27 ], [ 1, %.lr.ph.preheader ]
  %82 = add i64 %indvars.iv73, -3
  %83 = add i64 %indvars.iv73, 1
  %xtraiter83 = and i64 %83, 3
  %lcmp.mod84 = icmp eq i64 %xtraiter83, 0
  br i1 %lcmp.mod84, label %.prol.loopexit82, label %.prol.preheader81.preheader

.prol.preheader81.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader81

.prol.preheader81:                                ; preds = %.prol.preheader81.preheader, %.prol.preheader81
  %indvars.iv66.prol = phi i64 [ %indvars.iv.next67.prol, %.prol.preheader81 ], [ 0, %.prol.preheader81.preheader ]
  %prol.iter85 = phi i64 [ %prol.iter85.sub, %.prol.preheader81 ], [ %xtraiter83, %.prol.preheader81.preheader ]
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv66.prol
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, %3
  store double %86, double* %84, align 8
  %indvars.iv.next67.prol = add nuw nsw i64 %indvars.iv66.prol, 1
  %prol.iter85.sub = add i64 %prol.iter85, -1
  %prol.iter85.cmp = icmp eq i64 %prol.iter85.sub, 0
  br i1 %prol.iter85.cmp, label %.prol.loopexit82.loopexit, label %.prol.preheader81, !llvm.loop !8

.prol.loopexit82.loopexit:                        ; preds = %.prol.preheader81
  br label %.prol.loopexit82

.prol.loopexit82:                                 ; preds = %.prol.loopexit82.loopexit, %.lr.ph
  %indvars.iv66.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next67.prol, %.prol.loopexit82.loopexit ]
  %87 = icmp ult i64 %indvars.iv73, 3
  br i1 %87, label %.preheader27, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit82
  %88 = sub i64 %82, %indvars.iv66.unr
  %89 = lshr i64 %88, 2
  %90 = add nuw nsw i64 %89, 1
  %min.iters.check = icmp ult i64 %90, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader120, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %90, 1
  %n.vec = sub nsw i64 %90, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %91 = add i64 %indvars.iv66.unr, 4
  %92 = shl nuw i64 %89, 2
  %93 = add i64 %91, %92
  %94 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %93, %94
  br i1 %cmp.zero, label %.lr.ph.new.preheader120, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %95 = shl i64 %index, 2
  %96 = add i64 %indvars.iv66.unr, %95
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %96
  %98 = bitcast double* %97 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %98, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec88 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec89 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec90 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %99 = fmul <2 x double> %strided.vec, %broadcast.splat92
  %100 = fmul <2 x double> %strided.vec88, %broadcast.splat92
  %101 = fmul <2 x double> %strided.vec89, %broadcast.splat92
  %102 = add nsw i64 %96, 3
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %102
  %104 = fmul <2 x double> %strided.vec90, %broadcast.splat92
  %105 = getelementptr double, double* %103, i64 -3
  %106 = bitcast double* %105 to <8 x double>*
  %107 = shufflevector <2 x double> %99, <2 x double> %100, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %108 = shufflevector <2 x double> %101, <2 x double> %104, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %107, <4 x double> %108, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %106, align 8
  %index.next = add i64 %index, 2
  %109 = icmp eq i64 %index.next, %n.vec
  br i1 %109, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader27, label %.lr.ph.new.preheader120

.lr.ph.new.preheader120:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv66.ph = phi i64 [ %indvars.iv66.unr, %min.iters.checked ], [ %indvars.iv66.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader120, %.lr.ph.new
  %indvars.iv66 = phi i64 [ %indvars.iv.next67.3, %.lr.ph.new ], [ %indvars.iv66.ph, %.lr.ph.new.preheader120 ]
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv66
  %111 = bitcast double* %110 to <2 x double>*
  %112 = load <2 x double>, <2 x double>* %111, align 8
  %113 = fmul <2 x double> %112, %10
  %114 = bitcast double* %110 to <2 x double>*
  store <2 x double> %113, <2 x double>* %114, align 8
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv.next67.1
  %116 = bitcast double* %115 to <2 x double>*
  %117 = load <2 x double>, <2 x double>* %116, align 8
  %118 = fmul <2 x double> %117, %12
  %119 = bitcast double* %115 to <2 x double>*
  store <2 x double> %118, <2 x double>* %119, align 8
  %indvars.iv.next67.3 = add nsw i64 %indvars.iv66, 4
  %exitcond70.3 = icmp eq i64 %indvars.iv.next67.3, %indvars.iv71
  br i1 %exitcond70.3, label %.preheader27.loopexit, label %.lr.ph.new, !llvm.loop !10

.preheader27.loopexit:                            ; preds = %.lr.ph.new
  br label %.preheader27

.preheader27:                                     ; preds = %.preheader27.loopexit, %middle.block, %.prol.loopexit82
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond76 = icmp eq i64 %83, %wide.trip.count75
  br i1 %exitcond76, label %._crit_edge37.loopexit121, label %.lr.ph

._crit_edge37.loopexit:                           ; preds = %._crit_edge33.us
  br label %._crit_edge37

._crit_edge37.loopexit121:                        ; preds = %.preheader27
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37.loopexit121, %._crit_edge37.loopexit, %6
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv14, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !3, !4}
!10 = distinct !{!10, !2, !3, !4}
