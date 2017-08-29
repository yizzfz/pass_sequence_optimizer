; ModuleID = 'A.ll'
source_filename = "lu.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader13.lr.ph, label %._crit_edge63.thread

._crit_edge63.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge16

.preheader13.lr.ph:                               ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, 7
  %7 = add i32 %0, -2
  %8 = sext i32 %0 to i64
  %wide.trip.count130.7 = zext i32 %0 to i64
  %9 = add nsw i64 %wide.trip.count130.7, -8
  %10 = trunc i32 %6 to i3
  br label %.lr.ph52

.lr.ph52:                                         ; preds = %._crit_edge59, %.preheader13.lr.ph
  %indvars.iv151 = phi i3 [ %indvars.iv.next152, %._crit_edge59 ], [ %10, %.preheader13.lr.ph ]
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge59 ], [ 2, %.preheader13.lr.ph ]
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %._crit_edge59 ], [ 0, %.preheader13.lr.ph ]
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge59 ], [ 1, %.preheader13.lr.ph ]
  %11 = zext i3 %indvars.iv151 to i64
  %12 = add nuw nsw i64 %11, 4294967295
  %13 = and i64 %12, 4294967295
  %14 = add i64 %indvars.iv149, %13
  %15 = sub nsw i64 0, %indvars.iv139
  %16 = trunc i64 %15 to i32
  %17 = add i32 %6, %16
  br label %18

; <label>:18:                                     ; preds = %18, %.lr.ph52
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %18 ], [ 0, %.lr.ph52 ]
  %19 = sub nsw i64 0, %indvars.iv120
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, %0
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, %5
  %24 = fadd double %23, 1.000000e+00
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv120
  store double %24, double* %25, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next121, %indvars.iv137
  br i1 %exitcond125, label %._crit_edge53, label %18

._crit_edge53:                                    ; preds = %18
  %26 = add i32 %7, %16
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %27 = icmp slt i64 %indvars.iv.next140, %8
  br i1 %27, label %.lr.ph58, label %._crit_edge59

.lr.ph58:                                         ; preds = %._crit_edge53
  %xtraiter134 = and i32 %17, 7
  %lcmp.mod135 = icmp eq i32 %xtraiter134, 0
  br i1 %lcmp.mod135, label %.prol.loopexit133, label %.prol.preheader132.preheader

.prol.preheader132.preheader:                     ; preds = %.lr.ph58
  br label %.prol.preheader132

.prol.preheader132:                               ; preds = %.prol.preheader132.preheader, %.prol.preheader132
  %indvars.iv128.prol = phi i64 [ %indvars.iv.next129.prol, %.prol.preheader132 ], [ %indvars.iv137, %.prol.preheader132.preheader ]
  %prol.iter136 = phi i32 [ %prol.iter136.sub, %.prol.preheader132 ], [ %xtraiter134, %.prol.preheader132.preheader ]
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv128.prol
  store double 0.000000e+00, double* %28, align 8
  %indvars.iv.next129.prol = add nuw nsw i64 %indvars.iv128.prol, 1
  %prol.iter136.sub = add nsw i32 %prol.iter136, -1
  %prol.iter136.cmp = icmp eq i32 %prol.iter136.sub, 0
  br i1 %prol.iter136.cmp, label %.prol.loopexit133.loopexit, label %.prol.preheader132, !llvm.loop !1

.prol.loopexit133.loopexit:                       ; preds = %.prol.preheader132
  br label %.prol.loopexit133

.prol.loopexit133:                                ; preds = %.prol.loopexit133.loopexit, %.lr.ph58
  %indvars.iv128.unr = phi i64 [ %indvars.iv137, %.lr.ph58 ], [ %14, %.prol.loopexit133.loopexit ]
  %29 = icmp ult i32 %26, 7
  br i1 %29, label %._crit_edge59, label %.lr.ph58.new.preheader

.lr.ph58.new.preheader:                           ; preds = %.prol.loopexit133
  %30 = sub i64 %9, %indvars.iv128.unr
  %31 = lshr i64 %30, 3
  %32 = add nuw nsw i64 %31, 1
  %min.iters.check = icmp ult i64 %32, 2
  br i1 %min.iters.check, label %.lr.ph58.new.preheader148, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph58.new.preheader
  %n.mod.vf = and i64 %32, 1
  %n.vec = sub nsw i64 %32, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %33 = add i64 %indvars.iv128.unr, 8
  %34 = shl nuw i64 %31, 3
  %35 = add i64 %33, %34
  %36 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %35, %36
  br i1 %cmp.zero, label %.lr.ph58.new.preheader148, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %37 = shl i64 %index, 3
  %38 = add i64 %indvars.iv128.unr, %37
  %39 = add nsw i64 %38, 7
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %39
  %41 = getelementptr double, double* %40, i64 -7
  %42 = bitcast double* %41 to <16 x double>*
  store <16 x double> zeroinitializer, <16 x double>* %42, align 8
  %index.next = add i64 %index, 2
  %43 = icmp eq i64 %index.next, %n.vec
  br i1 %43, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge59, label %.lr.ph58.new.preheader148

.lr.ph58.new.preheader148:                        ; preds = %middle.block, %min.iters.checked, %.lr.ph58.new.preheader
  %indvars.iv128.ph = phi i64 [ %indvars.iv128.unr, %min.iters.checked ], [ %indvars.iv128.unr, %.lr.ph58.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph58.new

.lr.ph58.new:                                     ; preds = %.lr.ph58.new.preheader148, %.lr.ph58.new
  %indvars.iv128 = phi i64 [ %indvars.iv.next129.7, %.lr.ph58.new ], [ %indvars.iv128.ph, %.lr.ph58.new.preheader148 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv128
  store double 0.000000e+00, double* %44, align 8
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv.next129
  store double 0.000000e+00, double* %45, align 8
  %indvars.iv.next129.1 = add nsw i64 %indvars.iv128, 2
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv.next129.1
  store double 0.000000e+00, double* %46, align 8
  %indvars.iv.next129.2 = add nsw i64 %indvars.iv128, 3
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv.next129.2
  store double 0.000000e+00, double* %47, align 8
  %indvars.iv.next129.3 = add nsw i64 %indvars.iv128, 4
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv.next129.3
  store double 0.000000e+00, double* %48, align 8
  %indvars.iv.next129.4 = add nsw i64 %indvars.iv128, 5
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv.next129.4
  store double 0.000000e+00, double* %49, align 8
  %indvars.iv.next129.5 = add nsw i64 %indvars.iv128, 6
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv.next129.5
  store double 0.000000e+00, double* %50, align 8
  %indvars.iv.next129.6 = add nsw i64 %indvars.iv128, 7
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv.next129.6
  store double 0.000000e+00, double* %51, align 8
  %indvars.iv.next129.7 = add nsw i64 %indvars.iv128, 8
  %exitcond131.7 = icmp eq i64 %indvars.iv.next129.7, %wide.trip.count130.7
  br i1 %exitcond131.7, label %._crit_edge59.loopexit, label %.lr.ph58.new, !llvm.loop !6

._crit_edge59.loopexit:                           ; preds = %.lr.ph58.new
  br label %._crit_edge59

._crit_edge59:                                    ; preds = %._crit_edge59.loopexit, %middle.block, %.prol.loopexit133, %._crit_edge53
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv139
  store double 1.000000e+00, double* %52, align 8
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next140, %wide.trip.count130.7
  %indvars.iv.next150 = add nuw i64 %indvars.iv149, 1
  %indvars.iv.next152 = add i3 %indvars.iv151, -1
  br i1 %exitcond142, label %._crit_edge63, label %.lr.ph52

._crit_edge63:                                    ; preds = %._crit_edge59
  %53 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %54 = add i32 %0, -1
  %55 = zext i32 %54 to i64
  %56 = shl nuw nsw i64 %55, 3
  %57 = add nuw nsw i64 %56, 8
  %xtraiter116 = and i32 %0, 3
  %lcmp.mod117 = icmp eq i32 %xtraiter116, 0
  br i1 %lcmp.mod117, label %.preheader12.us.prol.loopexit, label %._crit_edge45.us.prol.preheader

._crit_edge45.us.prol.preheader:                  ; preds = %._crit_edge63
  %58 = add nsw i32 %xtraiter116, -1
  %59 = zext i32 %58 to i64
  %60 = bitcast i8* %53 to [2000 x [2000 x double]]*
  br label %._crit_edge45.us.prol

._crit_edge45.us.prol:                            ; preds = %._crit_edge45.us.prol.preheader, %._crit_edge45.us.prol
  %indvars.iv112.prol = phi i64 [ %indvars.iv.next113.prol, %._crit_edge45.us.prol ], [ 0, %._crit_edge45.us.prol.preheader ]
  %prol.iter118 = phi i32 [ %prol.iter118.sub, %._crit_edge45.us.prol ], [ %xtraiter116, %._crit_edge45.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %60, i64 0, i64 %indvars.iv112.prol, i64 0
  %scevgep111.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.prol, i8 0, i64 %57, i32 8, i1 false)
  %indvars.iv.next113.prol = add nuw nsw i64 %indvars.iv112.prol, 1
  %prol.iter118.sub = add nsw i32 %prol.iter118, -1
  %prol.iter118.cmp = icmp eq i32 %prol.iter118.sub, 0
  br i1 %prol.iter118.cmp, label %.preheader12.us.prol.loopexit.loopexit, label %._crit_edge45.us.prol, !llvm.loop !8

.preheader12.us.prol.loopexit.loopexit:           ; preds = %._crit_edge45.us.prol
  %61 = add nuw nsw i64 %59, 1
  br label %.preheader12.us.prol.loopexit

.preheader12.us.prol.loopexit:                    ; preds = %.preheader12.us.prol.loopexit.loopexit, %._crit_edge63
  %indvars.iv112.unr = phi i64 [ 0, %._crit_edge63 ], [ %61, %.preheader12.us.prol.loopexit.loopexit ]
  %62 = icmp ult i32 %54, 3
  br i1 %62, label %.preheader10.us.preheader, label %._crit_edge45.us.3.preheader

._crit_edge45.us.3.preheader:                     ; preds = %.preheader12.us.prol.loopexit
  %63 = add nsw i64 %wide.trip.count130.7, -4
  %64 = sub nsw i64 %63, %indvars.iv112.unr
  %65 = lshr i64 %64, 2
  %66 = and i64 %65, 1
  %lcmp.mod = icmp eq i64 %66, 0
  br i1 %lcmp.mod, label %._crit_edge45.us.3.prol.preheader, label %._crit_edge45.us.3.prol.loopexit

._crit_edge45.us.3.prol.preheader:                ; preds = %._crit_edge45.us.3.preheader
  br label %._crit_edge45.us.3.prol

._crit_edge45.us.3.prol:                          ; preds = %._crit_edge45.us.3.prol.preheader
  %67 = bitcast i8* %53 to [2000 x [2000 x double]]*
  %scevgep.prol154 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv112.unr, i64 0
  %scevgep111.prol155 = bitcast double* %scevgep.prol154 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.prol155, i8 0, i64 %57, i32 8, i1 false)
  %indvars.iv.next113.prol156 = add nuw nsw i64 %indvars.iv112.unr, 1
  %scevgep.1.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv.next113.prol156, i64 0
  %scevgep111.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.1.prol, i8 0, i64 %57, i32 8, i1 false)
  %indvars.iv.next113.1.prol = add nsw i64 %indvars.iv112.unr, 2
  %scevgep.2.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv.next113.1.prol, i64 0
  %scevgep111.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.2.prol, i8 0, i64 %57, i32 8, i1 false)
  %indvars.iv.next113.2.prol = add nsw i64 %indvars.iv112.unr, 3
  %scevgep.3.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv.next113.2.prol, i64 0
  %scevgep111.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.3.prol, i8 0, i64 %57, i32 8, i1 false)
  %indvars.iv.next113.3.prol = add nsw i64 %indvars.iv112.unr, 4
  br label %._crit_edge45.us.3.prol.loopexit

._crit_edge45.us.3.prol.loopexit:                 ; preds = %._crit_edge45.us.3.prol, %._crit_edge45.us.3.preheader
  %indvars.iv112.unr157 = phi i64 [ %indvars.iv112.unr, %._crit_edge45.us.3.preheader ], [ %indvars.iv.next113.3.prol, %._crit_edge45.us.3.prol ]
  %68 = icmp eq i64 %65, 0
  br i1 %68, label %.preheader10.us.preheader.loopexit, label %._crit_edge45.us.3.preheader.new

._crit_edge45.us.3.preheader.new:                 ; preds = %._crit_edge45.us.3.prol.loopexit
  %69 = bitcast i8* %53 to [2000 x [2000 x double]]*
  %70 = bitcast i8* %53 to [2000 x [2000 x double]]*
  br label %._crit_edge45.us.3

.preheader10.us.preheader.loopexit.unr-lcssa:     ; preds = %._crit_edge45.us.3
  br label %.preheader10.us.preheader.loopexit

.preheader10.us.preheader.loopexit:               ; preds = %._crit_edge45.us.3.prol.loopexit, %.preheader10.us.preheader.loopexit.unr-lcssa
  br label %.preheader10.us.preheader

.preheader10.us.preheader:                        ; preds = %.preheader10.us.preheader.loopexit, %.preheader12.us.prol.loopexit
  %xtraiter95 = and i32 %0, 1
  %71 = icmp eq i32 %xtraiter95, 0
  %72 = icmp eq i32 %0, 1
  %73 = bitcast i8* %53 to [2000 x [2000 x double]]*
  %74 = bitcast i8* %53 to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %1 to i64
  br label %.preheader9.lr.ph.us

._crit_edge24.us-lcssa.us.us:                     ; preds = %._crit_edge22.us.us
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next102, %wide.trip.count130.7
  br i1 %exitcond104, label %.preheader.us.preheader, label %.preheader9.lr.ph.us

.preheader.us.preheader:                          ; preds = %._crit_edge24.us-lcssa.us.us
  %75 = add nsw i32 %xtraiter116, -1
  %76 = zext i32 %75 to i64
  %77 = add nuw nsw i64 %76, 1
  %78 = icmp eq i32 %xtraiter116, 0
  %79 = icmp ult i32 %54, 3
  %80 = bitcast i8* %53 to [2000 x [2000 x double]]*
  %81 = bitcast i8* %53 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader9.lr.ph.us:                             ; preds = %._crit_edge24.us-lcssa.us.us, %.preheader10.us.preheader
  %indvars.iv101 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next102, %._crit_edge24.us-lcssa.us.us ]
  %sunkaddr145 = shl i64 %indvars.iv101, 3
  %sunkaddr146 = add i64 %sunkaddr, %sunkaddr145
  %sunkaddr147 = inttoptr i64 %sunkaddr146 to double*
  br label %.preheader9.us.us

.preheader9.us.us:                                ; preds = %._crit_edge22.us.us, %.preheader9.lr.ph.us
  %indvars.iv97 = phi i64 [ 0, %.preheader9.lr.ph.us ], [ %indvars.iv.next98, %._crit_edge22.us.us ]
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv101
  br i1 %71, label %.prol.loopexit94, label %83

; <label>:83:                                     ; preds = %.preheader9.us.us
  %84 = load double, double* %82, align 8
  %85 = load double, double* %sunkaddr147, align 8
  %86 = fmul double %84, %85
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv97, i64 0
  %88 = load double, double* %87, align 8
  %89 = fadd double %86, %88
  store double %89, double* %87, align 8
  br label %.prol.loopexit94

.prol.loopexit94:                                 ; preds = %.preheader9.us.us, %83
  %indvars.iv89.unr.ph = phi i64 [ 1, %83 ], [ 0, %.preheader9.us.us ]
  br i1 %72, label %._crit_edge22.us.us, label %.preheader9.us.us.new.preheader

.preheader9.us.us.new.preheader:                  ; preds = %.prol.loopexit94
  br label %.preheader9.us.us.new

._crit_edge22.us.us.loopexit:                     ; preds = %.preheader9.us.us.new
  br label %._crit_edge22.us.us

._crit_edge22.us.us:                              ; preds = %._crit_edge22.us.us.loopexit, %.prol.loopexit94
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next98, %wide.trip.count130.7
  br i1 %exitcond100, label %._crit_edge24.us-lcssa.us.us, label %.preheader9.us.us

.preheader9.us.us.new:                            ; preds = %.preheader9.us.us.new.preheader, %.preheader9.us.us.new
  %indvars.iv89 = phi i64 [ %indvars.iv.next90.1, %.preheader9.us.us.new ], [ %indvars.iv89.unr.ph, %.preheader9.us.us.new.preheader ]
  %90 = load double, double* %82, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv101
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv97, i64 %indvars.iv89
  %95 = load double, double* %94, align 8
  %96 = fadd double %93, %95
  store double %96, double* %94, align 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %97 = load double, double* %82, align 8
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next90, i64 %indvars.iv101
  %99 = load double, double* %98, align 8
  %100 = fmul double %97, %99
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next90
  %102 = load double, double* %101, align 8
  %103 = fadd double %100, %102
  store double %103, double* %101, align 8
  %indvars.iv.next90.1 = add nuw nsw i64 %indvars.iv89, 2
  %exitcond92.1 = icmp eq i64 %indvars.iv.next90.1, %wide.trip.count130.7
  br i1 %exitcond92.1, label %._crit_edge22.us.us.loopexit, label %.preheader9.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br i1 %78, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter116, %.prol.preheader.preheader ]
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %81, i64 0, i64 %indvars.iv85, i64 %indvars.iv.prol
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv85, i64 %indvars.iv.prol
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !9

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %77, %.prol.loopexit.loopexit ]
  br i1 %79, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv85, i64 %indvars.iv
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv85, i64 %indvars.iv
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv85, i64 %indvars.iv.next
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next.1
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv85, i64 %indvars.iv.next.1
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next.2
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv85, i64 %indvars.iv.next.2
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count130.7
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond = icmp eq i64 %indvars.iv.next86, %wide.trip.count130.7
  br i1 %exitcond, label %._crit_edge16.loopexit, label %.preheader.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %._crit_edge63.thread
  %129 = phi i8* [ %4, %._crit_edge63.thread ], [ %53, %._crit_edge16.loopexit ]
  tail call void @free(i8* %129) #4
  ret void

._crit_edge45.us.3:                               ; preds = %._crit_edge45.us.3, %._crit_edge45.us.3.preheader.new
  %indvars.iv112 = phi i64 [ %indvars.iv112.unr157, %._crit_edge45.us.3.preheader.new ], [ %indvars.iv.next113.3.1, %._crit_edge45.us.3 ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv112, i64 0
  %scevgep111 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111, i8 0, i64 %57, i32 8, i1 false)
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv.next113, i64 0
  %scevgep111.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.1, i8 0, i64 %57, i32 8, i1 false)
  %indvars.iv.next113.1 = add nsw i64 %indvars.iv112, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv.next113.1, i64 0
  %scevgep111.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.2, i8 0, i64 %57, i32 8, i1 false)
  %indvars.iv.next113.2 = add nsw i64 %indvars.iv112, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv.next113.2, i64 0
  %scevgep111.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.3, i8 0, i64 %57, i32 8, i1 false)
  %indvars.iv.next113.3 = add nsw i64 %indvars.iv112, 4
  %scevgep.1158 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %70, i64 0, i64 %indvars.iv.next113.3, i64 0
  %scevgep111.1159 = bitcast double* %scevgep.1158 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.1159, i8 0, i64 %57, i32 8, i1 false)
  %indvars.iv.next113.1160 = add nsw i64 %indvars.iv112, 5
  %scevgep.1.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %70, i64 0, i64 %indvars.iv.next113.1160, i64 0
  %scevgep111.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.1.1, i8 0, i64 %57, i32 8, i1 false)
  %indvars.iv.next113.1.1 = add nsw i64 %indvars.iv112, 6
  %scevgep.2.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %70, i64 0, i64 %indvars.iv.next113.1.1, i64 0
  %scevgep111.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.2.1, i8 0, i64 %57, i32 8, i1 false)
  %indvars.iv.next113.2.1 = add nsw i64 %indvars.iv112, 7
  %scevgep.3.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %70, i64 0, i64 %indvars.iv.next113.2.1, i64 0
  %scevgep111.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.3.1, i8 0, i64 %57, i32 8, i1 false)
  %indvars.iv.next113.3.1 = add nsw i64 %indvars.iv112, 8
  %exitcond115.3.1 = icmp eq i64 %indvars.iv.next113.3.1, %wide.trip.count130.7
  br i1 %exitcond115.3.1, label %.preheader10.us.preheader.loopexit.unr-lcssa, label %._crit_edge45.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]*) unnamed_addr #2 {
  %3 = alloca [2000 x double]*, align 8
  store [2000 x double]* %1, [2000 x double]** %3, align 8
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader6.preheader, label %._crit_edge21

.preheader6.preheader:                            ; preds = %2
  %wide.trip.count76 = zext i32 %0 to i64
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.preheader, %._crit_edge16
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge16 ], [ 0, %.preheader6.preheader ]
  %5 = phi [2000 x double]* [ %65, %._crit_edge16 ], [ %1, %.preheader6.preheader ]
  %6 = add nuw i64 %indvars.iv74, 4294967295
  %7 = icmp sgt i64 %indvars.iv74, 0
  br i1 %7, label %.preheader5.preheader, label %._crit_edge16

.preheader5.preheader:                            ; preds = %.preheader6
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.preheader, %._crit_edge
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge ], [ 0, %.preheader5.preheader ]
  %8 = phi [2000 x double]* [ %34, %._crit_edge ], [ %5, %.preheader5.preheader ]
  %9 = add nuw i64 %indvars.iv46, 4294967295
  %10 = icmp sgt i64 %indvars.iv46, 0
  br i1 %10, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader5
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv74, i64 %indvars.iv46
  %.pre = load double, double* %11, align 8
  %xtraiter79 = and i64 %indvars.iv46, 1
  %lcmp.mod = icmp eq i64 %xtraiter79, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %12

; <label>:12:                                     ; preds = %.lr.ph
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv74, i64 0
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 0, i64 %indvars.iv46
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %.pre, %17
  store double %18, double* %11, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %12
  %indvars.iv.unr.ph = phi i64 [ 1, %12 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %18, %12 ], [ %.pre, %.lr.ph ]
  %19 = trunc i64 %9 to i32
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %._crit_edge.loopexit, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %21 = phi double [ %33, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv74, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv, i64 %indvars.iv46
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %11, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv74, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv.next, i64 %indvars.iv46
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  store double %33, double* %11, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv46
  br i1 %exitcond.1, label %._crit_edge.loopexit.loopexit, label %.lr.ph.new

._crit_edge.loopexit.loopexit:                    ; preds = %.lr.ph.new
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge.loopexit.loopexit, %.prol.loopexit
  %.pre31 = load [2000 x double]*, [2000 x double]** %3, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader5, %._crit_edge.loopexit
  %34 = phi [2000 x double]* [ %.pre31, %._crit_edge.loopexit ], [ %8, %.preheader5 ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv46, i64 %indvars.iv46
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %34, i64 %indvars.iv74, i64 %indvars.iv46
  %38 = load double, double* %37, align 8
  %39 = fdiv double %38, %36
  store double %39, double* %37, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, %indvars.iv74
  br i1 %exitcond, label %.preheader.lr.ph, label %.preheader5

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %40 = load [2000 x double]*, [2000 x double]** %3, align 8
  %xtraiter6178 = and i64 %indvars.iv74, 1
  %41 = trunc i64 %6 to i32
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %indvars.iv74, i64 0
  %43 = icmp eq i64 %xtraiter6178, 0
  %44 = icmp eq i32 %41, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.lr.ph, %._crit_edge13.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge13.us ], [ %indvars.iv74, %.preheader.lr.ph ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %indvars.iv74, i64 %indvars.iv66
  %.pre32 = load double, double* %45, align 8
  br i1 %43, label %.prol.loopexit60, label %46

; <label>:46:                                     ; preds = %.preheader.us
  %47 = load double, double* %42, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 0, i64 %indvars.iv66
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fsub double %.pre32, %50
  store double %51, double* %45, align 8
  br label %.prol.loopexit60

.prol.loopexit60:                                 ; preds = %.preheader.us, %46
  %indvars.iv52.unr.ph = phi i64 [ 1, %46 ], [ 0, %.preheader.us ]
  %.unr63.ph = phi double [ %51, %46 ], [ %.pre32, %.preheader.us ]
  br i1 %44, label %._crit_edge13.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit60
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.1, %.preheader.us.new ], [ %indvars.iv52.unr.ph, %.preheader.us.new.preheader ]
  %52 = phi double [ %64, %.preheader.us.new ], [ %.unr63.ph, %.preheader.us.new.preheader ]
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %indvars.iv74, i64 %indvars.iv52
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %indvars.iv52, i64 %indvars.iv66
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fsub double %52, %57
  store double %58, double* %45, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %indvars.iv74, i64 %indvars.iv.next53
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %indvars.iv.next53, i64 %indvars.iv66
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fsub double %58, %63
  store double %64, double* %45, align 8
  %indvars.iv.next53.1 = add nuw nsw i64 %indvars.iv52, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next53.1, %indvars.iv74
  br i1 %exitcond58.1, label %._crit_edge13.us.loopexit, label %.preheader.us.new

._crit_edge13.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit, %.prol.loopexit60
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next67, %wide.trip.count76
  br i1 %exitcond71, label %._crit_edge16.loopexit, label %.preheader.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.preheader6
  %65 = phi [2000 x double]* [ %5, %.preheader6 ], [ %40, %._crit_edge16.loopexit ]
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %wide.trip.count76
  br i1 %exitcond77, label %._crit_edge21.loopexit, label %.preheader6

._crit_edge21.loopexit:                           ; preds = %._crit_edge16
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge3

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next9, %._crit_edge.us ]
  %9 = mul nsw i64 %8, %indvars.iv8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, %wide.trip.count
  br i1 %exitcond11, label %._crit_edge3.loopexit, label %.preheader.us

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !2}
!9 = distinct !{!9, !2}
