; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %.cast = bitcast i8* %3 to double*
  %.cast1 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %.cast, double* %.cast1)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %.cast, double* %.cast1)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %8

; <label>:8:                                      ; preds = %.lr.ph
  %9 = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, %7
  %10 = extractelement <2 x double> %9, i32 0
  %11 = extractelement <2 x double> %9, i32 1
  store double %10, double* %1, align 8
  store double %11, double* %2, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %8
  %indvars.iv.unr = phi i64 [ 1, %8 ], [ 0, %.lr.ph ]
  %12 = icmp eq i32 %0, 1
  br i1 %12, label %.loopexit, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.new ]
  %13 = trunc i64 %indvars.iv to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = insertelement <2 x double> undef, double %14, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fadd <2 x double> %17, <double 2.000000e+00, double 3.000000e+00>
  %19 = fdiv <2 x double> %18, %7
  %20 = bitcast double* %15 to <2 x double>*
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %22 = bitcast double* %21 to <2 x double>*
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %23 = trunc i64 %indvars.iv.next to i32
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %24, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = fadd <2 x double> %26, <double 2.000000e+00, double 3.000000e+00>
  %28 = fdiv <2 x double> %27, %7
  %29 = shufflevector <2 x double> %19, <2 x double> %28, <2 x i32> <i32 0, i32 2>
  store <2 x double> %29, <2 x double>* %20, align 8
  %30 = shufflevector <2 x double> %19, <2 x double> %28, <2 x i32> <i32 1, i32 3>
  store <2 x double> %30, <2 x double>* %22, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.loopexit.loopexit, label %.lr.ph.new

.loopexit.loopexit:                               ; preds = %.lr.ph.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.prol.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge10.preheader

._crit_edge10.preheader:                          ; preds = %._crit_edge.lr.ph
  %8 = add i32 %0, -1
  %xtraiter120 = and i32 %0, 7
  %lcmp.mod = icmp eq i32 %xtraiter120, 0
  br i1 %lcmp.mod, label %._crit_edge10.prol.loopexit, label %._crit_edge10.prol.preheader

._crit_edge10.prol.preheader:                     ; preds = %._crit_edge10.preheader
  br label %._crit_edge10.prol

._crit_edge10.prol:                               ; preds = %._crit_edge10.prol, %._crit_edge10.prol.preheader
  %9 = phi i32 [ %10, %._crit_edge10.prol ], [ 0, %._crit_edge10.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge10.prol ], [ %xtraiter120, %._crit_edge10.prol.preheader ]
  %10 = add nuw nsw i32 %9, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge10.prol.loopexit.unr-lcssa, label %._crit_edge10.prol, !llvm.loop !1

._crit_edge10.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge10.prol
  br label %._crit_edge10.prol.loopexit

._crit_edge10.prol.loopexit:                      ; preds = %._crit_edge10.preheader, %._crit_edge10.prol.loopexit.unr-lcssa
  %.unr = phi i32 [ 0, %._crit_edge10.preheader ], [ %10, %._crit_edge10.prol.loopexit.unr-lcssa ]
  %11 = icmp ult i32 %8, 7
  br i1 %11, label %.loopexit.loopexit119, label %._crit_edge10.preheader.new

._crit_edge10.preheader.new:                      ; preds = %._crit_edge10.prol.loopexit
  br label %._crit_edge10

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %xtraiter = and i32 %1, 1
  %12 = and i32 %6, 1
  %wide.trip.count18.1 = zext i32 %6 to i64
  %13 = add nsw i64 %wide.trip.count18.1, -2
  %scevgep55 = getelementptr double, double* %2, i64 2
  %14 = add nsw i64 %wide.trip.count18.1, -2
  %scevgep58 = getelementptr double, double* %3, i64 -1
  %scevgep61 = getelementptr double, double* %3, i64 3
  %15 = add nsw i64 %wide.trip.count18.1, -2
  %scevgep82 = getelementptr double, double* %3, i64 2
  %16 = add nsw i64 %wide.trip.count18.1, -2
  %scevgep85 = getelementptr double, double* %2, i64 -1
  %scevgep88 = getelementptr double, double* %2, i64 3
  %17 = icmp eq i32 %xtraiter, 0
  %18 = icmp eq i32 %1, 3
  %19 = icmp eq i32 %12, 0
  %sunkaddr44 = ptrtoint double* %3 to i64
  %sunkaddr45 = add i64 %sunkaddr44, 8
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to double*
  %sunkaddr47 = ptrtoint double* %3 to i64
  %sunkaddr48 = add i64 %sunkaddr47, 16
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to double*
  %sunkaddr50 = ptrtoint double* %2 to i64
  %sunkaddr51 = add i64 %sunkaddr50, 8
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to double*
  %20 = icmp eq i32 %6, 2
  %sunkaddr = ptrtoint double* %2 to i64
  %sunkaddr36 = add i64 %sunkaddr, 8
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to double*
  %sunkaddr38 = ptrtoint double* %2 to i64
  %sunkaddr39 = add i64 %sunkaddr38, 16
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to double*
  %sunkaddr41 = ptrtoint double* %3 to i64
  %sunkaddr42 = add i64 %sunkaddr41, 8
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to double*
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge10.us, %._crit_edge.us.preheader
  %21 = phi i32 [ 0, %._crit_edge.us.preheader ], [ %59, %._crit_edge10.us ]
  br i1 %17, label %.prol.loopexit, label %22

; <label>:22:                                     ; preds = %._crit_edge.us
  %23 = load double, double* %2, align 8
  %24 = load double, double* %sunkaddr37, align 8
  %25 = fadd double %23, %24
  %26 = load double, double* %sunkaddr40, align 8
  %27 = fadd double %25, %26
  %28 = fmul double %27, 3.333300e-01
  store double %28, double* %sunkaddr43, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %._crit_edge.us, %22
  %indvars.iv.unr.ph = phi i64 [ 2, %22 ], [ 1, %._crit_edge.us ]
  br i1 %18, label %.lr.ph9.us.preheader, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit
  %29 = sub nsw i64 %15, %indvars.iv.unr.ph
  %30 = lshr i64 %29, 1
  %31 = add nuw i64 %30, 1
  %min.iters.check74 = icmp ult i64 %31, 2
  br i1 %min.iters.check74, label %._crit_edge.us.new.preheader118, label %min.iters.checked75

._crit_edge.us.new.preheader118:                  ; preds = %middle.block72, %vector.memcheck95, %min.iters.checked75, %._crit_edge.us.new.preheader
  %indvars.iv.ph = phi i64 [ %ind.end100, %middle.block72 ], [ %indvars.iv.unr.ph, %vector.memcheck95 ], [ %indvars.iv.unr.ph, %min.iters.checked75 ], [ %indvars.iv.unr.ph, %._crit_edge.us.new.preheader ]
  br label %._crit_edge.us.new

min.iters.checked75:                              ; preds = %._crit_edge.us.new.preheader
  %n.mod.vf76 = and i64 %31, 1
  %n.vec77 = sub i64 %31, %n.mod.vf76
  %cmp.zero78 = icmp eq i64 %n.vec77, 0
  br i1 %cmp.zero78, label %._crit_edge.us.new.preheader118, label %vector.memcheck95

vector.memcheck95:                                ; preds = %min.iters.checked75
  %scevgep80 = getelementptr double, double* %3, i64 %indvars.iv.unr.ph
  %32 = sub nsw i64 %16, %indvars.iv.unr.ph
  %33 = and i64 %32, -2
  %34 = add nsw i64 %indvars.iv.unr.ph, %33
  %scevgep83 = getelementptr double, double* %scevgep82, i64 %34
  %scevgep86 = getelementptr double, double* %scevgep85, i64 %indvars.iv.unr.ph
  %scevgep89 = getelementptr double, double* %scevgep88, i64 %34
  %bound091 = icmp ult double* %scevgep80, %scevgep89
  %bound192 = icmp ult double* %scevgep86, %scevgep83
  %memcheck.conflict94 = and i1 %bound091, %bound192
  %35 = add nuw nsw i64 %indvars.iv.unr.ph, 2
  %36 = shl nuw i64 %30, 1
  %37 = add i64 %35, %36
  %38 = shl nuw nsw i64 %n.mod.vf76, 1
  %ind.end100 = sub i64 %37, %38
  br i1 %memcheck.conflict94, label %._crit_edge.us.new.preheader118, label %vector.body71.preheader

vector.body71.preheader:                          ; preds = %vector.memcheck95
  br label %vector.body71

vector.body71:                                    ; preds = %vector.body71.preheader, %vector.body71
  %index97 = phi i64 [ %index.next98, %vector.body71 ], [ 0, %vector.body71.preheader ]
  %39 = shl i64 %index97, 1
  %offset.idx102 = or i64 %indvars.iv.unr.ph, %39
  %40 = add nsw i64 %offset.idx102, -1
  %41 = getelementptr inbounds double, double* %2, i64 %40
  %42 = bitcast double* %41 to <4 x double>*
  %wide.vec106 = load <4 x double>, <4 x double>* %42, align 8, !alias.scope !3
  %strided.vec107 = shufflevector <4 x double> %wide.vec106, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec108 = shufflevector <4 x double> %wide.vec106, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %43 = fadd <2 x double> %strided.vec107, %strided.vec108
  %44 = add nuw nsw i64 %offset.idx102, 1
  %45 = getelementptr inbounds double, double* %2, i64 %44
  %46 = getelementptr double, double* %45, i64 -1
  %47 = bitcast double* %46 to <4 x double>*
  %wide.vec109 = load <4 x double>, <4 x double>* %47, align 8, !alias.scope !3
  %strided.vec111 = shufflevector <4 x double> %wide.vec109, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %48 = fadd <2 x double> %43, %strided.vec111
  %49 = fmul <2 x double> %48, <double 3.333300e-01, double 3.333300e-01>
  %50 = bitcast double* %45 to <4 x double>*
  %wide.vec112 = load <4 x double>, <4 x double>* %50, align 8, !alias.scope !3
  %strided.vec114 = shufflevector <4 x double> %wide.vec112, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %51 = fadd <4 x double> %wide.vec109, %wide.vec112
  %52 = shufflevector <4 x double> %51, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %53 = fadd <2 x double> %52, %strided.vec114
  %54 = fmul <2 x double> %53, <double 3.333300e-01, double 3.333300e-01>
  %55 = getelementptr inbounds double, double* %3, i64 %44
  %56 = getelementptr double, double* %55, i64 -1
  %57 = bitcast double* %56 to <4 x double>*
  %interleaved.vec115 = shufflevector <2 x double> %49, <2 x double> %54, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec115, <4 x double>* %57, align 8, !alias.scope !6, !noalias !3
  %index.next98 = add i64 %index97, 2
  %58 = icmp eq i64 %index.next98, %n.vec77
  br i1 %58, label %middle.block72, label %vector.body71, !llvm.loop !8

middle.block72:                                   ; preds = %vector.body71
  %cmp.n101 = icmp eq i64 %n.mod.vf76, 0
  br i1 %cmp.n101, label %.lr.ph9.us.preheader, label %._crit_edge.us.new.preheader118

._crit_edge10.us.loopexit:                        ; preds = %.lr.ph9.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.loopexit, %middle.block, %.lr.ph9.us.prol.loopexit
  %59 = add nuw nsw i32 %21, 1
  %exitcond20 = icmp eq i32 %59, %0
  br i1 %exitcond20, label %.loopexit.loopexit, label %._crit_edge.us

.lr.ph9.us:                                       ; preds = %.lr.ph9.us.preheader117, %.lr.ph9.us
  %indvars.iv16 = phi i64 [ %75, %.lr.ph9.us ], [ %indvars.iv16.ph, %.lr.ph9.us.preheader117 ]
  %60 = add nsw i64 %indvars.iv16, -1
  %61 = getelementptr inbounds double, double* %3, i64 %60
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds double, double* %3, i64 %indvars.iv16
  %64 = load double, double* %63, align 8
  %65 = fadd double %62, %64
  %66 = add nuw nsw i64 %indvars.iv16, 1
  %67 = getelementptr inbounds double, double* %3, i64 %66
  %68 = load double, double* %67, align 8
  %69 = fadd double %65, %68
  %70 = fmul double %69, 3.333300e-01
  %71 = getelementptr inbounds double, double* %2, i64 %indvars.iv16
  store double %70, double* %71, align 8
  %72 = load double, double* %63, align 8
  %73 = load double, double* %67, align 8
  %74 = fadd double %72, %73
  %75 = add nsw i64 %indvars.iv16, 2
  %76 = getelementptr inbounds double, double* %3, i64 %75
  %77 = load double, double* %76, align 8
  %78 = fadd double %74, %77
  %79 = fmul double %78, 3.333300e-01
  %80 = getelementptr inbounds double, double* %2, i64 %66
  store double %79, double* %80, align 8
  %exitcond19.1 = icmp eq i64 %75, %wide.trip.count18.1
  br i1 %exitcond19.1, label %._crit_edge10.us.loopexit, label %.lr.ph9.us, !llvm.loop !11

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader118, %._crit_edge.us.new
  %indvars.iv = phi i64 [ %96, %._crit_edge.us.new ], [ %indvars.iv.ph, %._crit_edge.us.new.preheader118 ]
  %81 = add nsw i64 %indvars.iv, -1
  %82 = getelementptr inbounds double, double* %2, i64 %81
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %85 = load double, double* %84, align 8
  %86 = fadd double %83, %85
  %87 = add nuw nsw i64 %indvars.iv, 1
  %88 = getelementptr inbounds double, double* %2, i64 %87
  %89 = load double, double* %88, align 8
  %90 = fadd double %86, %89
  %91 = fmul double %90, 3.333300e-01
  %92 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %91, double* %92, align 8
  %93 = load double, double* %84, align 8
  %94 = load double, double* %88, align 8
  %95 = fadd double %93, %94
  %96 = add nsw i64 %indvars.iv, 2
  %97 = getelementptr inbounds double, double* %2, i64 %96
  %98 = load double, double* %97, align 8
  %99 = fadd double %95, %98
  %100 = fmul double %99, 3.333300e-01
  %101 = getelementptr inbounds double, double* %3, i64 %87
  store double %100, double* %101, align 8
  %exitcond.1 = icmp eq i64 %96, %wide.trip.count18.1
  br i1 %exitcond.1, label %.lr.ph9.us.preheader.loopexit, label %._crit_edge.us.new, !llvm.loop !12

.lr.ph9.us.preheader.loopexit:                    ; preds = %._crit_edge.us.new
  br label %.lr.ph9.us.preheader

.lr.ph9.us.preheader:                             ; preds = %.lr.ph9.us.preheader.loopexit, %middle.block72, %.prol.loopexit
  br i1 %19, label %.lr.ph9.us.prol, label %.lr.ph9.us.prol.loopexit

.lr.ph9.us.prol:                                  ; preds = %.lr.ph9.us.preheader
  %102 = load double, double* %3, align 8
  %103 = load double, double* %sunkaddr46, align 8
  %104 = fadd double %102, %103
  %105 = load double, double* %sunkaddr49, align 8
  %106 = fadd double %104, %105
  %107 = fmul double %106, 3.333300e-01
  store double %107, double* %sunkaddr52, align 8
  br label %.lr.ph9.us.prol.loopexit

.lr.ph9.us.prol.loopexit:                         ; preds = %.lr.ph9.us.preheader, %.lr.ph9.us.prol
  %indvars.iv16.unr.ph = phi i64 [ 2, %.lr.ph9.us.prol ], [ 1, %.lr.ph9.us.preheader ]
  br i1 %20, label %._crit_edge10.us, label %.lr.ph9.us.preheader33

.lr.ph9.us.preheader33:                           ; preds = %.lr.ph9.us.prol.loopexit
  %108 = sub nsw i64 %13, %indvars.iv16.unr.ph
  %109 = lshr i64 %108, 1
  %110 = add nuw i64 %109, 1
  %min.iters.check = icmp ult i64 %110, 2
  br i1 %min.iters.check, label %.lr.ph9.us.preheader117, label %min.iters.checked

.lr.ph9.us.preheader117:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph9.us.preheader33
  %indvars.iv16.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv16.unr.ph, %vector.memcheck ], [ %indvars.iv16.unr.ph, %min.iters.checked ], [ %indvars.iv16.unr.ph, %.lr.ph9.us.preheader33 ]
  br label %.lr.ph9.us

min.iters.checked:                                ; preds = %.lr.ph9.us.preheader33
  %n.mod.vf = and i64 %110, 1
  %n.vec = sub i64 %110, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph9.us.preheader117, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %2, i64 %indvars.iv16.unr.ph
  %111 = sub nsw i64 %14, %indvars.iv16.unr.ph
  %112 = and i64 %111, -2
  %113 = add nsw i64 %indvars.iv16.unr.ph, %112
  %scevgep56 = getelementptr double, double* %scevgep55, i64 %113
  %scevgep59 = getelementptr double, double* %scevgep58, i64 %indvars.iv16.unr.ph
  %scevgep62 = getelementptr double, double* %scevgep61, i64 %113
  %bound0 = icmp ult double* %scevgep, %scevgep62
  %bound1 = icmp ult double* %scevgep59, %scevgep56
  %memcheck.conflict = and i1 %bound0, %bound1
  %114 = add nuw nsw i64 %indvars.iv16.unr.ph, 2
  %115 = shl nuw i64 %109, 1
  %116 = add i64 %114, %115
  %117 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %116, %117
  br i1 %memcheck.conflict, label %.lr.ph9.us.preheader117, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %118 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv16.unr.ph, %118
  %119 = add nsw i64 %offset.idx, -1
  %120 = getelementptr inbounds double, double* %3, i64 %119
  %121 = bitcast double* %120 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %121, align 8, !alias.scope !13
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec64 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %122 = fadd <2 x double> %strided.vec, %strided.vec64
  %123 = add nuw nsw i64 %offset.idx, 1
  %124 = getelementptr inbounds double, double* %3, i64 %123
  %125 = getelementptr double, double* %124, i64 -1
  %126 = bitcast double* %125 to <4 x double>*
  %wide.vec65 = load <4 x double>, <4 x double>* %126, align 8, !alias.scope !13
  %strided.vec67 = shufflevector <4 x double> %wide.vec65, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %127 = fadd <2 x double> %122, %strided.vec67
  %128 = fmul <2 x double> %127, <double 3.333300e-01, double 3.333300e-01>
  %129 = bitcast double* %124 to <4 x double>*
  %wide.vec68 = load <4 x double>, <4 x double>* %129, align 8, !alias.scope !13
  %strided.vec70 = shufflevector <4 x double> %wide.vec68, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %130 = fadd <4 x double> %wide.vec65, %wide.vec68
  %131 = shufflevector <4 x double> %130, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %132 = fadd <2 x double> %131, %strided.vec70
  %133 = fmul <2 x double> %132, <double 3.333300e-01, double 3.333300e-01>
  %134 = getelementptr inbounds double, double* %2, i64 %123
  %135 = getelementptr double, double* %134, i64 -1
  %136 = bitcast double* %135 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %128, <2 x double> %133, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %136, align 8, !alias.scope !16, !noalias !13
  %index.next = add i64 %index, 2
  %137 = icmp eq i64 %index.next, %n.vec
  br i1 %137, label %middle.block, label %vector.body, !llvm.loop !18

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge10.us, label %.lr.ph9.us.preheader117

._crit_edge10:                                    ; preds = %._crit_edge10, %._crit_edge10.preheader.new
  %138 = phi i32 [ %.unr, %._crit_edge10.preheader.new ], [ %139, %._crit_edge10 ]
  %139 = add nsw i32 %138, 8
  %exitcond25.7 = icmp eq i32 %139, %0
  br i1 %exitcond25.7, label %.loopexit.loopexit119.unr-lcssa, label %._crit_edge10

.loopexit.loopexit:                               ; preds = %._crit_edge10.us
  br label %.loopexit

.loopexit.loopexit119.unr-lcssa:                  ; preds = %._crit_edge10
  br label %.loopexit.loopexit119

.loopexit.loopexit119:                            ; preds = %._crit_edge10.prol.loopexit, %.loopexit.loopexit119.unr-lcssa
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit119, %.loopexit.loopexit, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %2
  %8 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, %8
  br i1 %exitcond3, label %.loopexit.loopexit, label %.lr.ph

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !9, !10}
!12 = distinct !{!12, !9, !10}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !9, !10}
